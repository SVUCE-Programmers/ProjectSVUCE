import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:svuce_app/constants/assets.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class AuthenticationService extends BaseModel {
  final FirebaseAuth firebaseAuth;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  //for testing
  AuthenticationService({firebaseAuth})
      : this.firebaseAuth =
            firebaseAuth == null ? FirebaseAuth.instance : firebaseAuth;

  Future loginUser({@required String email, @required String password}) async {
    try {
      var authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      await _populateCurrentUser(authResult.user);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  User _currentUser;
  User get currentUser => _currentUser;

  Future createStudent(
      {@required String email,
      @required String password,
      @required String fullName,
      @required String rollNo}) async {
    try {
      var authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      _currentUser = User(
          id: authResult.user.uid,
          email: email,
          fullName: fullName,
          rollNo: rollNo,
          profileImg: defaultUserImage,
          userType: "STUDENT");

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  Future signOut() async {
    await firebaseAuth.signOut();
  }
}
