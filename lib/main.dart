import 'package:flutter/material.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/ui/router.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/views/startup_view.dart';

import 'managers/dialog_manager.dart';
import 'services/dialog_service.dart';
import 'ui/shared/font_styles.dart';

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
      navigatorKey: locator<NavigationService>().navigationKey,
      home: StartUpView(),
      onGenerateRoute: generateRoute,
      theme: ThemeData(
          fontFamily: 'Quicksand',
          primaryColor: primary,
          primarySwatch: Colors.lime,
          textTheme: TextTheme(body1: bodyText.copyWith(color: textPrimary)),
          errorColor: errorColor,
          dialogTheme: DialogTheme(
              titleTextStyle: bodyText.copyWith(color: textPrimary),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: secondaryLight,
              contentTextStyle: bodyText.copyWith(color: textPrimary)),
          scaffoldBackgroundColor: secondaryDark),
    );
  }
}
