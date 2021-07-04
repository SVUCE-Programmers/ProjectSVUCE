import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';

import 'internet_connection.dart';

enum InternetConnectionStatus {
  connected,
  disconnected,
}

@lazySingleton
class ConnectivityServices {
  final log = getLogger("Connectivity Service");
  bool hasNetwork = true;

  final StreamController<bool> _connectionStatus =
      StreamController<bool>.broadcast();
  initializeConnectionService() async {
    _connectionStatus.add(true);
    InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        log.d("Is Online");
        _connectionStatus.add(true);
        hasNetwork = true;
      } else {
        log.w("Is Offline");
        _connectionStatus.add(false);
        hasNetwork = false;
      }
    });
  }

  Stream<bool> listenStream() {
    return _connectionStatus.stream;
  }

  getStatus() {
    if (hasNetwork) {
      return InternetConnectionStatus.connected;
    } else {
      return InternetConnectionStatus.disconnected;
    }
  }
}
