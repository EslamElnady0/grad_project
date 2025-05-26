import 'dart:async';
import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import '../../../features/chat/data/models/get_messages_response.dart';
import '../../data/repos/socket_repo.dart';
import '../../events/message events/new_message_event.dart';
import '../../helpers/constants.dart';
import '../../lifecycle/app_lifecycle_cubit.dart';
import '../../networking/network_monitor.dart';
import 'global_socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  final SocketRepo _repo;
  final NetworkMonitor _networkMonitor;
  final AppLifecycleCubit _lifecycleCubit;

  StreamSubscription? _networkSub;
  StreamSubscription? _lifecycleSub;
  String? userToken;
  bool _shouldBeConnected = false;
  bool _isUserRegistered = false;
  SocketCubit(
    this._repo,
    this._networkMonitor,
    this._lifecycleCubit,
  ) : super(SocketInitial()) {
    _networkSub = _networkMonitor.isConnected.listen(_onNetworkChange);
    _lifecycleSub = _lifecycleCubit.stream.listen(_onLifecycleChange);
  }

  Future<void> assignUserToken() async {
    userToken = await SharedPrefHelper.getSecuredString(Constants.token) ?? '';
    log("user token: $userToken");
  }

  Future<void> init({Function? onConnected}) async {
    emit(SocketConnecting());
    if (userToken.isNullOrEmpty()) return;
    try {
      _shouldBeConnected = true;
      await _repo.initSocket(onConnected: onConnected, token: userToken ?? "");
      emit(SocketConnected());
    } catch (e) {
      log("Socket init failed: $e");
      emit(SocketError(e.toString()));
    }
  }

  void _onNetworkChange(bool isConnected) {
    log('Network status: $isConnected');
    if (isConnected && _shouldBeConnected) {
      emit(SocketConnecting());
      _repo.socketService.connect(
        onConnect: () {
          emit(SocketNeedsRegisterUser());
        },
      );
    } else if (!isConnected) {
      _repo.disposeSocket();
      _isUserRegistered = false;
      emit(SocketDisconnected());
    }
  }

  void _onLifecycleChange(
    AppLifecycleState state,
  ) {
    log('AppLifecycleState: $state');
    if (state == AppLifecycleState.resumed && _shouldBeConnected) {
      _repo.socketService.connect(
        onConnect: () {
          emit(SocketNeedsRegisterUser());
        },
      );
      emit(SocketConnecting());
    } else if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      _repo.disposeSocket();
      _isUserRegistered = false;
      emit(SocketDisconnected());
    }
  }

  void registerUser({required BuildContext context}) {
    if (_isUserRegistered) return;
    emit(SocketRegistering());
    _repo.registerUser(
      {},
      onSuccess: () {
        _isUserRegistered = true;
        emit(SocketRegistered());
        recieveMessage(context: context);
      },
      onFailure: (error) {
        emit(SocketError(error));
      },
    );
  }

  void messageDeliveredTo(String messageId) {
    _repo.messageDeliveredToUser(
      {"messageId": messageId},
      onSuccess: () {
        emit(SocketMessageDelivered());
      },
      onFailure: (error) {
        emit(SocketError(error));
      },
    );
  }

  void recieveMessage({required BuildContext context}) {
    _repo.recieveMessage(onSuccess: (data) {
      final newMessage = Message.fromJson(data["data"]);
      messageDeliveredTo(newMessage.id);
      eventBus.fire(NewMessageEvent(newMessage));
      emit(SocketMessageReceived());
    });
  }

  void disposeSocket() {
    _shouldBeConnected = false;
    _repo.disposeSocket();
    emit(SocketDisconnected());
  }

  @override
  Future<void> close() {
    _networkSub?.cancel();
    _lifecycleSub?.cancel();
    _repo.disposeSocket();
    return super.close();
  }
}
