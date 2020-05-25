import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@registerModule
abstract class RegisterDependencies {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  @lazySingleton
  Firestore get firestore => Firestore.instance;

  @lazySingleton
  HiveInterface get hive => Hive;

  @lazySingleton
  http.Client get client => http.Client();
}
