import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.router.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/utils/date_utils.dart';

import 'auth_service.dart';

@Singleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  final FirebaseAuth _firebaseAuth;
  final UsersRepository _userService = locator<UsersRepository>();
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();
  final NavigationService _navigationService = locator<NavigationService>();

  // for testing
  AuthServiceImpl(this._firebaseAuth);

  /// This method uses FirebaseAuth to Sign in
  /// It will generate Firebase User if there are no errors and we return
  ///  [true] if there is a user. The main advantage with this approach is that
  ///  we can catch the errors and can return the error message.
  /// After Login we even get the profile of the user from firestore and store it
  ///  in [currentUser]
  Future loginUser({@required String email, @required String password}) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      await _populateCurrentUser(authResult.user);

      return authResult.user != null;
    } catch (e) {
      return e;
    }
  }

  UserModel currentUser;

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
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      await updateUserProfile(displayName: fullName, profileImg: profileImg);

      currentUser = UserModel(
          id: authResult.user.uid,
          email: email,
          fullName: fullName,
          bio: bio,
          contact: contact,
          profileImg: profileImg,
          rollNo: rollNo,
          collegeName: "SVUCE",
          userType: "STUDENT");

      await _userService.storeUser(currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  /// An utility function to check whether the [User] Logged in.
  /// If user is logged in we get the profile from Firestore and store it
  ///   in [currentUser]
  bool isUserLoggedIn() {
    var user = _firebaseAuth.currentUser;
    return user != null;
  }

  /// This function is responsible for getting user profile from Firestore.
  Future _populateCurrentUser(User user) async {
    if (user != null) {
      currentUser = await _userService.getUser(user.uid);
      // _userStream.add(currentUser);
    }
  }

  /// This function will help users reset their password by using FirebaseAuth API
  Future resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (e) {
      return e.message;
    }
  }

  String getStudentPresentYear() {
    String roll = currentUser.rollNo;
    return getStudentYear(roll);
  }

  Future signOut() async {
    await _firebaseAuth.signOut();
    bool temp = _sharedPreferences.getBool("isDark") ?? false;
    _sharedPreferences.clear();
    _sharedPreferences.setBool("isBool", temp);
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  Future updateUserProfile({String displayName, String profileImg}) async {
    User user = _firebaseAuth.currentUser;
    await user.updateProfile(displayName: displayName, photoURL: profileImg);
  }
}
