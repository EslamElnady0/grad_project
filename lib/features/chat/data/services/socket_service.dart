import 'dart:developer';

// import 'package:grad_project/core/helpers/constants.dart';
// import 'package:grad_project/core/helpers/shared_pref_helper.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketService {
  late io.Socket socket;

  Future<void> init({Function? onConnect}) async {
    socket = io.io(
      'wss://ngu-question-hub.azurewebsites.net',
      io.OptionBuilder().setTransports(['websocket']).setQuery({
        'token': "21|LvlWyk2DnyojGLbYYbz2pUPvzMTBz0uN0Fp6q5ea97670cd9"
      }).build(),
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

  void on(String event, Function(dynamic) handler) {
    log('Listening to event: $event');
    socket.on(event, (data) {
      log('Received $event with data: $data');
      handler(data);
    });
  }

  void off(String event) => socket.off(event);
}
