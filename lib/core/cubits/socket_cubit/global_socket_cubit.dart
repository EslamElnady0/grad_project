import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grad_project/core/helpers/extensions.dart';
import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import '../../data/repos/socket_repo.dart';
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

  void registerUser() {
    emit(SocketRegistering());
    _repo.registerUser(
      {},
      onSuccess: () {
        emit(SocketRegistered());
        log("user registered successfully");
      },
      onFailure: (error) {
        emit(SocketError(error));
        log("user registration failed");
      },
    );
  }

  void disposeSocket() {
    _repo.disposeSocket();
    emit(SocketDisconnected());
  }
}
