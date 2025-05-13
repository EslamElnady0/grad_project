import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  late io.Socket socket;
  final String token;

  SocketService({required this.token});
  Future<void> init({Function? onConnect}) async {
    log(token);
    socket = io.io(
      'wss://ngu-question-hub.azurewebsites.net',
      io.OptionBuilder()
          .setTransports(['websocket']).setQuery({'token': token}).build(),
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
}
