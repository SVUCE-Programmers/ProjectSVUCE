import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svuce_app/app/locator.dart';

class ThemeService extends ChangeNotifier {
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();
  final String key = "isDark";
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeService() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _loadFromPrefs() {
    _darkTheme = _sharedPreferences.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    _sharedPreferences.setBool(key, _darkTheme);
  }
}
