import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/app/theme.dart';

import 'hive_db/setup_hive.dart';

void main() async {
  setupLocator();
  setupHive();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SVUCE App',
      theme: themeData(context),
      onGenerateRoute: Router().onGenerateRoute,
      navigatorKey: locator<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
