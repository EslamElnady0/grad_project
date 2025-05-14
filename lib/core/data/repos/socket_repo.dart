import 'dart:developer';

import '../../services/socket_service.dart';

class SocketRepo {
  final SocketService _socketService;

  SocketRepo(this._socketService);

  Future<void> initSocket(
      {Function? onConnected, required String token}) async {
    log("initializing socket ......");
    await _socketService.init(onConnect: onConnected, token: token);
  }

  void registerUser(
    Map<String, dynamic> userData, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    log("registering user .....");
    _socketService.emit(SocketEvents.userRegister, userData);

    _socketService.once(SocketEvents.userRegisterSuccess, (_) {
      log("user registered successfully");
      onSuccess();
    });

    _socketService.once(SocketEvents.userRegisterError, (error) {
      log("user registration failed");
      onFailure(error.toString());
    });
  }

  void disposeSocket() {
    _socketService.dispose();
  }
}
