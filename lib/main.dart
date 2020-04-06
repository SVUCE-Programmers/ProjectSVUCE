import 'package:flutter/material.dart';
import 'package:svuce_app/locator.dart';

import 'managers/dialog_manager.dart';
import 'services/dialog_service.dart';

void main() {
  setupLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      debugShowCheckedModeBanner: false,
      title: 'SVUCE APP',
    );
  }
}
