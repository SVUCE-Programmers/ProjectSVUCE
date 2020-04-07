import 'package:get_it/get_it.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => AuthenticationService());
}
