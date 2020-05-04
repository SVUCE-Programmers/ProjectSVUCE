import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/services/push_notification_service.dart';
import 'package:svuce_app/ui/views/login/login_viewmodel.dart.dart';

@registerModule
abstract class RegisterExternalServices {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  SnackbarService get snackbarService;

  @lazySingleton
  AuthenticationService get authenticationService;

  @lazySingleton
  FirestoreService get firestoreService;

  @lazySingleton
  PushNotificationService get pushNotificationService;

  @lazySingleton
  LoginViewModel get loginViewModel;
}
