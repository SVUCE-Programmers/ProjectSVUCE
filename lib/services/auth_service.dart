import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/user.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/ui/views/time_table/utils.dart';

@lazySingleton
class AuthenticationService {
  final FirebaseAuth firebaseAuth;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  // for testing
  AuthenticationService({FirebaseAuth firebaseAuth})
      : this.firebaseAuth =
            firebaseAuth == null ? FirebaseAuth.instance : firebaseAuth;

  /// This method uses FirebaseAuth to Sign in
  /// It will generate Firebase User if there are no errors and we return
  ///  [true] if there is a user. The main advantage with this approach is that
  ///  we can catch the errors and can return the error message.
  /// After Login we even get the profile of the user from firestore and store it
  ///  in [currentUser]
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

  /// This method creates a Firebase user with FirebaseAuth API and returns
  ///  Firebase User as AuthResult if there is no errors and at the same we
  ///  get the profile of the user from Firestore and stores it in [currentUser]
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

      await updateUserProfile(displayName: fullName, profileImg: profileImg);

      _currentUser = User(
          id: authResult.user.uid,
          email: email,
          fullName: fullName,
          bio: bio,
          contact: contact,
          profileImg: profileImg,
          rollNo: rollNo,
          collegeName: "SVUCE",
          userType: "STUDENT");

      await _firestoreService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  /// An utility function to check whether the [User] Logged in.
  /// If user is logged in we get the profile from Firestore and store it
  ///   in [currentUser]
  Future<bool> isUserLoggedIn() async {
    var user = await firebaseAuth.currentUser();
    await _populateCurrentUser(user);
    return user != null;
  }

  /// This function is responsible for getting user profile from Firestore.
  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }

  /// This function will help users reset their password by using FirebaseAuth API
  Future resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e.message;
    }
  }

  getStudentPresentYear(){
    String roll=currentUser.rollNo;
    return getStudentYear(roll);
  }

  Future signOut() async {
    await firebaseAuth.signOut();
  }

  Future updateUserProfile({String displayName, String profileImg}) async {
    UserUpdateInfo updateInfo = UserUpdateInfo();
    updateInfo.displayName = displayName;
    updateInfo.photoUrl = profileImg;

    FirebaseUser user = await firebaseAuth.currentUser();
    user.updateProfile(updateInfo);
  }
}
