import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'dart:async';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;

  late io.Socket socket;
  late String _token;
  bool _isInitialized = false;

  // Retry/reconnect strategy
  // int _reconnectAttempts = 0;
  // Timer? _reconnectTimer;
  // final int _maxReconnectDelaySeconds = 60;
  // final int _maxAttempts = 10;

  SocketService._internal();

  static bool get isInitialized => _instance._isInitialized;

  Future<void> init({required String token, Function? onConnect}) async {
    if (_isInitialized) return;
    _token = token;

    _connectSocket(onConnect: onConnect);
    _isInitialized = true;
  }

  void _connectSocket({Function? onConnect}) {
    if (_isInitialized) return;
    log('Socket connecting...');
    socket = io.io(
      'wss://ngu-question-hub.azurewebsites.net',
      io.OptionBuilder()
          .setTransports(['websocket']).setQuery({'token': _token}).build(),
    );

    socket.onConnect((_) {
      log('Socket connected ✅');
      //  _reconnectAttempts = 0;
      //   _reconnectTimer?.cancel();
      if (onConnect != null) onConnect();
    });

    socket.onConnectError((data) {
      log('Socket connection error: $data');
      // _scheduleReconnect();
    });

    socket.onDisconnect((_) {
      log('Socket disconnected');
      //  _scheduleReconnect();
    });
  }

  void connect({Function()? onConnect}) {
    log('Socket connecting...');
    _connectSocket();
    onConnect != null ? onConnect() : null;
  }

  void disconnect() {
    socket.disconnect();
    _isInitialized = false;
    // _reconnectTimer?.cancel();
  }

  void emit(String event, dynamic data) => socket.emit(event, data);

  void once(String event, Function(dynamic) handler) =>
      socket.once(event, handler);

  void on(String event, Function(dynamic) handler) {
    log('Listening to event: $event');
    socket.on(event, (data) {
      log('Received $event with data: $data');
      handler(data);
    });
  }

  void off(String event) {
    log('Unsubscribing from event: $event');
    socket.off(event);
  }

  void dispose() {
    log('Disposing socket...');
    socket.dispose();
    socket.close();
    socket.destroy();
    socket.disconnect();
    _isInitialized = false;
    //  _reconnectTimer?.cancel();
  }
  // void _scheduleReconnect() {
  //   if (_reconnectAttempts >= _maxAttempts) {
  //     log('Max reconnect attempts reached. Giving up.');
  //     return;
  //   }
  //   _reconnectAttempts++;
  //   int delaySeconds = _calculateBackoff(_reconnectAttempts);
  //   log('Reconnecting in $delaySeconds seconds... (attempt $_reconnectAttempts)');
  //   _reconnectTimer?.cancel();
  //   _reconnectTimer = Timer(Duration(seconds: delaySeconds), () {
  //     if (!_isInitialized) return;
  //     log('Attempting to reconnect...');
  //     socket.dispose();
  //     socket.close();
  //     socket.destroy();
  //     _connectSocket();
  //   });
  // }

  // int _calculateBackoff(int attempt) {
  //   // Exponential backoff with cap
  //   int delay = (2 << (attempt - 1));
  //   if (delay > _maxReconnectDelaySeconds) return _maxReconnectDelaySeconds;
  //   return delay;
  // }
}

class SocketEvents {
  SocketEvents._();
  static const String userRegister = 'User-Register';
  static const String userRegisterError = 'user-register-error';
  static const String userRegisterSuccess = 'user-register-success';
  static const String sendMessage = 'Send-Message';
  static const String sendMessageError = 'send-message-error';
  static const String recieveMessage = 'recieve-message';
  static const String messageDelivered = 'Message-Delivered';
  static const String messageDeliveredToError = 'message-deliveredTo-error';
  static const String messageDeliveredToSuccess = 'message-deliveredTo-success';
  static const String messageSeen = 'Message-Seen';
  static const String messageSeenError = 'mmessage-seen-error';
  static const String messageSeenSuccess = 'message-seen-success';
}
