// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/register_services.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/services/push_notification_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerExternalServices = _$RegisterExternalServices();
  g.registerLazySingleton<AuthenticationService>(
      () => registerExternalServices.authenticationService);
  g.registerLazySingleton<FirestoreService>(
      () => registerExternalServices.firestoreService);
  g.registerLazySingleton<NavigationService>(
      () => registerExternalServices.navigationService);
  g.registerLazySingleton<PushNotificationService>(
      () => registerExternalServices.pushNotificationService);
  g.registerLazySingleton<SnackbarService>(
      () => registerExternalServices.snackbarService);
}

class _$RegisterExternalServices extends RegisterExternalServices {
  @override
  AuthenticationService get authenticationService => AuthenticationService();
  @override
  FirestoreService get firestoreService => FirestoreService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  PushNotificationService get pushNotificationService =>
      PushNotificationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
