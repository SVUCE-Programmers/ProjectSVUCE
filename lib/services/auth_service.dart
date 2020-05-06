import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/services/firestore_service.dart';

abstract class BaseAuth {
  Future createStudent(
      {String email,
      String password,
      String fullName,
      String rollNo,
      String contact,
      String profileImg,
      String bio});
  Future<bool> isUserLoggedIn();
  Future signOut();
  Future loginUser({String email, String password});
}

class AuthenticationService implements BaseAuth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  // for testing
  // AuthenticationService({FirebaseAuth firebaseAuth})
  //     : this.firebaseAuth =
  //           firebaseAuth == null ? FirebaseAuth.instance : firebaseAuth;

  @override
  Future loginUser({@required String email, @required String password}) async {
    try {
      var authResult = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      await _populateCurrentUser(authResult.user);

      return authResult.user != null;
    } catch (e) {
      return e?.message;
    }
  }

  User _currentUser;
  User get currentUser => _currentUser;

  @override
  Future createStudent(
      {@required String email,
      @required String password,
      @required String fullName,
      @required String rollNo,
      @required String contact,
      @required String profileImg,
      @required String bio}) async {
    try {
      var authResult = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      _currentUser = User(
          id: authResult.user.uid,
          email: email,
          fullName: fullName,
          bio: bio,
          contact: contact,
          profileImg: profileImg,
          rollNo: rollNo,
          collegeName: "SVUCE          ",
          userType: "STUDENT");

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  @override
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

  Future resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e.message;
    }
  }

  @override
  Future signOut() async {
    await firebaseAuth.signOut();
  }
}
