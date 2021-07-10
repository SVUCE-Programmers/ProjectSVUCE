import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/AppSetup.router.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/setupSnackbarUi.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/utils/date_utils.dart';

import '../firebaseAnalyticsService.dart';
import 'auth_service.dart';

@Singleton(as: AuthService)
class AuthServiceImpl implements AuthService {
  final log = getLogger("AuthServiceImpl");
  static final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  final UsersRepository _userService = locator<UsersRepository>();
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();

  // for testing

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

      _populateCurrentUser(authResult.user);
      await _analyticsService.logLogin();
      return authResult.user != null;
    } catch (e) {
      log.e(e);
      return e;
    }
  }

  UserModel currentUser;
  bool hasAdminAccess = false;
  bool isGuest = true;

  listenAuthStatusStream() {
    _firebaseAuth.authStateChanges().listen((user) {
      isGuest = (user == null);
    });
  }

  /// This method creates a Firebase user with FirebaseAuth API and returns
  ///  Firebase User as AuthResult if there is no errors and at the same we
  ///  get the profile of the user from Firestore and stores it in [currentUser]
  Future createStudent({
    @required String email,
    @required String password,
  }) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _userService
          .updateUser({"id": authResult.user.uid, "email": "$email"});
      await _analyticsService.logSignUp();

      return authResult.user != null;
    } catch (e) {
      log.e("$e");
      return e?.toString();
    }
  }

  /// An utility function to check whether the [User] Logged in.
  /// If user is logged in we get the profile from Firestore and store it
  ///   in [currentUser]
  bool isUserLoggedIn() {
    var user = _firebaseAuth.currentUser;
    _populateCurrentUser(user);
    return user != null;
  }

  /// This function is responsible for getting user profile from Firestore.
  _populateCurrentUser(User user) {
    if (user != null) {
      _userService.getUserFromStream(user.email).listen((event) {
        currentUser = event;
        hasAdminAccess = currentUser.userType != "STUDENT";
        log.v("IS ADMIN IS:$hasAdminAccess");
      });
      // _userStream.add(currentUser);
    } else {
      isGuest = true;
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
    int roll = currentUser.rollNo;
    return getStudentYear(roll.toString());
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

  @override
  String getUid() {
    return _firebaseAuth.currentUser != null
        ? _firebaseAuth.currentUser.uid
        : null;
  }

  @override
  String getEmail() {
    return _firebaseAuth.currentUser != null
        ? _firebaseAuth.currentUser.email
        : null;
  }

  @override
  Future changePassword(String oldPassword, String newPassword) async {
    try {
      User user = _firebaseAuth.currentUser;
      var newUser;
      try {
        newUser = await _firebaseAuth.signInWithEmailAndPassword(
            email: user.email, password: oldPassword);
      } catch (e) {
        log.e("ERROR is:${e.message}");
        return false;
      }

      if (newUser != null && newUser.user != null) {
        await user.updatePassword(newPassword);
        _snackBarService.showCustomSnackBar(
          duration: Duration(seconds: 2),
          variant: SnackBarType.success,
          message: "Changed password successfully!",
        );
        return true;
      }
    } catch (e) {
      if (e.message == "Password should be at least 6 characters") {
        _snackBarService.showCustomSnackBar(
          duration: Duration(seconds: 2),
          variant: SnackBarType.info,
          message: "Password is too weak",
        );
      } else {
        log.e(e);
        _snackBarService.showCustomSnackBar(
          duration: Duration(seconds: 2),
          variant: SnackBarType.error,
          message: "Error occured,please login again!!",
        );
      }
      return false;
    }
  }
}
