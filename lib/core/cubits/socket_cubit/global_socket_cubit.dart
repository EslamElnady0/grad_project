import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import '../../../features/chat/data/models/get_messages_response.dart';
import '../../data/repos/socket_repo.dart';
import '../../events/message events/new_message_event.dart';
import '../../helpers/constants.dart';
import 'global_socket_state.dart';

class SocketCubit extends Cubit<SocketState> {
  final SocketRepo _repo;

  SocketCubit(this._repo) : super(SocketInitial());
  String? userToken;
  Future<void> assignUserToken() async {
    userToken = await SharedPrefHelper.getSecuredString(Constants.token) ?? '';
    log("user token: $userToken");
  }

  Future<void> init({Function? onConnected}) async {
    emit(SocketConnecting());
    if (userToken.isNullOrEmpty()) return;
    try {
      await _repo.initSocket(onConnected: onConnected, token: userToken ?? "");
      emit(SocketConnected());
    } catch (e) {
      log("Socket init failed: $e");
      emit(SocketError(e.toString()));
    }
  }

  void registerUser({required BuildContext context}) {
    emit(SocketRegistering());
    _repo.registerUser(
      {},
      onSuccess: () {
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
    _repo.disposeSocket();
    emit(SocketDisconnected());
  }
}
