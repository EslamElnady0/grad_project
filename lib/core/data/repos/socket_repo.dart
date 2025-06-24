import 'dart:developer';

import '../../services/socket_service.dart';

class SocketRepo {
  final SocketService _socketService;

  SocketRepo(this._socketService);
  SocketService get socketService => _socketService;

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

  void messageDeliveredToUser(
    Map<String, dynamic> userData, {
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    _socketService.emit(SocketEvents.messageDelivered, userData);

    _socketService.on(SocketEvents.messageDeliveredToSuccess, (data) {
      log("successfully message delivered : $data");
      onSuccess();
    });

    _socketService.once(SocketEvents.messageDeliveredToError, (error) {
      log("successfully message is not delivered : $error");
      onFailure(error.toString());
    });
  }

  void recieveMessage({required Function onSuccess}) {
    _socketService.on(SocketEvents.recieveMessage, (data) {
      onSuccess(data);
      log(data.toString());
    });
  }

  void disposeSocket() {
    _socketService.off(SocketEvents.recieveMessage);
    _socketService.off(SocketEvents.sendMessageError);
    _socketService.off(SocketEvents.messageDeliveredToSuccess);
    _socketService.off(SocketEvents.sendMessage);
    _socketService.off(SocketEvents.userRegisterSuccess);
    _socketService.off(SocketEvents.userRegisterError);
    _socketService.dispose();
  }
}
