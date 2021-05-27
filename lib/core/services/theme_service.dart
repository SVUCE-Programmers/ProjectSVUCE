import 'package:injectable/injectable.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';

import 'keyStorageService.dart';

@lazySingleton
class ThemeService with ReactiveServiceMixin {
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
    darkMode.value = !darkMode.value;
    log.i("Changing theme");
    await _keyStorageService.saveToDisk<bool>(key, darkMode.value);
    notifyListeners();
  }
}
