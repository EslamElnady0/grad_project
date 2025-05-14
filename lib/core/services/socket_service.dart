import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;

  late io.Socket socket;
  late String _token;
  bool _isInitialized = false;

  SocketService._internal();
  static bool get isInitialized => _instance._isInitialized;
  Future<void> init({required String token, Function? onConnect}) async {
    if (_isInitialized) return;
    _token = token;
    socket = io.io(
      'wss://ngu-question-hub.azurewebsites.net',
      io.OptionBuilder()
          .setTransports(['websocket']).setQuery({'token': _token}).build(),
    );

    socket.onConnect((_) {
      log('Socket connected ✅');
      if (onConnect != null) onConnect();
    });

    socket.onConnectError((data) {
      log('Socket connection error: $data');
    });

    socket.onDisconnect((_) {
      log('Socket disconnected');
    });

    _isInitialized = true;
  }

  void connect() {
    log('Socket connecting...');
    socket.connect();
  }

  void disconnect() => socket.disconnect();

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

  void off(String event) => socket.off(event);

  void dispose() {
    log('Disposing socket...');
    socket.dispose();
    socket.close();
    socket.destroy();
    socket.disconnect();
    _isInitialized = false;
  }
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
