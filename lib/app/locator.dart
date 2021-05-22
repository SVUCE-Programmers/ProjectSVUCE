import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locator.config.dart';

GetIt locator = GetIt.instance;

@injectableInit
Future<void> setupLocator() async {
  await _setupSp();
  $initGetIt(locator);
}

_setupSp() async {
  final instance = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => instance);
}
