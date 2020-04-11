import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class AuthenticationService extends BaseModel {
  final FirebaseAuth firebaseAuth;
  //for testing
  AuthenticationService({firebaseAuth})
      : this.firebaseAuth =
            firebaseAuth == null ? FirebaseAuth.instance : firebaseAuth;

  Future loginAsStudent(
      {@required String email, @required String password}) async {
    try {
      var user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future createStudent(
      {@required String email, @required String password}) async {
    try {
      var authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }
}
