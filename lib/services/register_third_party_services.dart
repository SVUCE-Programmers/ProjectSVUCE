import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:http/http.dart' as http;

@registerModule
abstract class RegisterExternalServices {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  SnackbarService get snackbarService;

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  HiveInterface get hive => Hive;

  @lazySingleton
  http.Client get client => http.Client();
}
