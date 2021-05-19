import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class RegisterDependencies {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @singleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @singleton
  HiveInterface get hive => Hive;

  @singleton
  Client get client => Client();

  @singleton
  NavigationService get navigationService => NavigationService();

  @singleton
  BottomSheetService get bottomSheetService => BottomSheetService();

  @singleton
  DialogService get dialogService => DialogService();

  @singleton
  SnackbarService get snackbarService => SnackbarService();
}
