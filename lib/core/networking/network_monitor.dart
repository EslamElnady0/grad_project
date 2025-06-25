import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkMonitor {
  final InternetConnectionChecker _checker = InternetConnectionChecker();

  Stream<bool> get isConnected => _checker.onStatusChange
      .map((status) => status == InternetConnectionStatus.connected);

  Future<bool> get hasConnection => _checker.hasConnection;
}
