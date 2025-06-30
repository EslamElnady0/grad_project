import 'dart:developer';

import '../../services/socket_service.dart';

class SocketRepo {
  final SocketService _socketService;

  SocketRepo(this._socketService);
  SocketService get socketService => _socketService;
  final Set<String> _activeListeners = {};
  void _addListenerOnce(String event, Function(dynamic) callback) {
    if (!_activeListeners.contains(event)) {
      socketService.on(event, callback);
      _activeListeners.add(event);
    } else {
      log('Listener already exists for event: $event, skipping...');
    }
  }

  /// Remove a specific listener and mark it as inactive
  void _removeListener(String event) {
    if (_activeListeners.contains(event)) {
      socketService.off(event);
      _activeListeners.remove(event);
    }
  }

  /// Remove all active listeners
  void _removeAllListeners() {
    for (String event in _activeListeners.toList()) {
      socketService.off(event);
    }
    _activeListeners.clear();
  }

//----------------------------------------------------------------------------------------
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

    _socketService.on(SocketEvents.userRegisterSuccess, (_) {
      log("user registered successfully");
      onSuccess();
    });

    _socketService.on(SocketEvents.userRegisterError, (error) {
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
      onSuccess(data);
    });

    _socketService.on(SocketEvents.messageDeliveredToError, (error) {
      onFailure(error.toString());
    });
  }

  void recieveMessage({required Function onSuccess}) {
    _socketService.on(SocketEvents.recieveMessage, (data) {
      onSuccess(data);
      log(data.toString());
    });
  }

  void unSeenMessages({
    required Function onSuccess,
    required Function(String error) onFailure,
  }) {
    _removeListener(SocketEvents.unSeenSuccess);
    _removeListener(SocketEvents.unSeenError);

    socketService.emit(SocketEvents.unSeen, {});
    _addListenerOnce(SocketEvents.unSeenSuccess, (data) {
      onSuccess(data);
    });
    _addListenerOnce(SocketEvents.unSeenError, (error) {
      log("unseen messages error: $error");
      onFailure(error.toString());
    });
  }

  void disposeSocket() {
    // _socketService.off(SocketEvents.recieveMessage);
    _socketService.off(SocketEvents.sendMessageError);
    // _socketService.off(SocketEvents.messageDeliveredToSuccess);
    _socketService.off(SocketEvents.sendMessage);
    _socketService.off(SocketEvents.userRegisterSuccess);
    _socketService.off(SocketEvents.userRegisterError);
    _removeAllListeners();
    _socketService.dispose();
  }
}
