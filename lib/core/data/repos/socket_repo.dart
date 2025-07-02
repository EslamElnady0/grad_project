import 'dart:developer';

import '../../../features/chat/data/models/get_messages_response.dart';
import '../../events/message events/messages_events.dart';
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
    _removeListener(SocketEvents.userRegisterSuccess);
    _removeListener(SocketEvents.userRegisterError);
    _removeListener(SocketEvents.messageDeliveredToError);
    _removeListener(SocketEvents.messageDeliveredToSuccess);
    _removeListener(SocketEvents.unSeenSuccess);
    _removeListener(SocketEvents.unSeenError);

    log("registering user .....");
    _socketService.emit(SocketEvents.userRegister, userData);

    _addListenerOnce(SocketEvents.userRegisterSuccess, (_) {
      log("user registered successfully");
      // unseen listeners success and failure
      _addListenerOnce(SocketEvents.unSeenSuccess, (data) {
        int count = data["count"];
        eventBus.fire(UnSeenMessagesEvent(count: count));
      });
      _addListenerOnce(SocketEvents.unSeenError, (error) {
        log("through log : unseen error: $error");
      });
      // message delivered listeners success and failure
      _addListenerOnce(SocketEvents.messageDeliveredToSuccess, (data) {
        Map<String, dynamic> rawMessage = data["data"];
        Message mgs = Message.fromJson(rawMessage);
        eventBus.fire(MessageUpdatedEvent(mgs));
      });
      _addListenerOnce(SocketEvents.messageDeliveredToError, (data) {
        log("message delivered error: $data");
      });
      recieveMessage();
      onSuccess();
    });

    _addListenerOnce(SocketEvents.userRegisterError, (error) {
      log("user registration failed");
      onFailure(error.toString());
    });
  }

  void messageDeliveredToUser(Map<String, dynamic> userData) {
    _socketService.emit(SocketEvents.messageDelivered, userData);
  }

  void recieveMessage() {
    _removeListener(SocketEvents.recieveMessage);
    _addListenerOnce(SocketEvents.recieveMessage, (data) {
      final newMessage = Message.fromJson(data["data"]);
      messageDeliveredToUser({"messageId": newMessage.id});
      eventBus.fire(NewMessageEvent(newMessage));
    });
  }

  void unSeenMessages() {
    socketService.emit(SocketEvents.unSeen, {});
  }

  void disposeSocket() {
    _removeAllListeners();
    _socketService.dispose();
  }
}
