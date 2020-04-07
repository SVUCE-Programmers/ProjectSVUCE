import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class AuthenticationService extends BaseModel {
  final _firebaseAuth = FirebaseAuth.instance;

  Future loginAsStudent(
      {@required String rollno, @required String password}) async {
    String email = "student" + rollno + "@svuce.com";
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future createStudent(
      {@required String rollno, @required String password}) async {
    String email = "student" + rollno + "@svuce.com";
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }
}
