import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/firebaseAnalyticsService.dart';

import 'keyStorageService.dart';

@lazySingleton
class ThemeService with ReactiveServiceMixin {
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  final log = getLogger("ThemeService");
  ThemeService() {
    listenToReactiveValues([darkMode]);
  }

  static KeyStorageService _keyStorageService = KeyStorageService();

  RxValue<bool> darkMode = RxValue<bool>(false);

  bool get isDarkMode =>
      darkMode.value == null ? getThemeMode() : darkMode.value;

  static const String key = "isDarkMode";

  bool getThemeMode() {
    bool value = _keyStorageService.getValue(key);
    darkMode.value = value == null ? true : value;
    return darkMode.value;
  }

  Future changeTheme() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: !isDarkMode ? Colors.grey[500] : Colors.grey[800]));
    darkMode.value = !darkMode.value;
    _analyticsService.logEvent(name: "Theme Switch", parameters: {
      "theme": "${darkMode.value ? "Dark Mode" : "Light Theme"}"
    });
    log.i("Changing theme");
    await _keyStorageService.saveToDisk<bool>(key, darkMode.value);
    notifyListeners();
  }
}
