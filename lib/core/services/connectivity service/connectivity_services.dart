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
  bool hasNetwork = false;

  StreamController<bool> connectionStatus = StreamController<bool>.broadcast();
  initializeConnectionService() async {
    connectionStatus.add(true);
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          log.d("Is Online");
          connectionStatus.add(true);
          hasNetwork = true;
          break;
        case InternetConnectionStatus.disconnected:
          log.w("Is Offline");
          connectionStatus.add(false);
          hasNetwork = false;
          break;
      }
    });
  }

  Stream listenStream() {
    return connectionStatus.stream;
  }

  getStatus() {
    if (hasNetwork) {
      return InternetConnectionStatus.connected;
    } else {
      return InternetConnectionStatus.disconnected;
    }
  }
}
