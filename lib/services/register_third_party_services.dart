import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@registerModule
abstract class RegisterExternalServices {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  SnackbarService get snackbarService;
  
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}
