import 'package:get_it/get_it.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/base_auth.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/services/push_notification_service.dart';
import 'services/dialog_service.dart';
import 'services/navigation_service.dart';
import 'viewmodels/home_viewmodel.dart';
import 'viewmodels/news_feed_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => PushNotificationService());
  locator.registerLazySingleton<BaseAuth>(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => NewsFeedViewModel());
}
