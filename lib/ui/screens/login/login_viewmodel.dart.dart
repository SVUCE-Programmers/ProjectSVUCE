import 'dart:io';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/core/mixins/validators.dart';

@lazySingleton
class LoginViewModel extends BaseViewModel with Validators {
  final AuthService _authenticationService = locator<AuthService>();

  final NavigationService _navigationService = locator<NavigationService>();

  final SnackbarService _snackbarService = locator<SnackbarService>();

  int _index = 0;
  int get index => _index;

  void changeTab(int index) {
    _index = index;
    emailError = '';
    passwordError = '';
    notifyListeners();
  }

  String emailError = '';
  String passwordError = '';

  bool get result => emailError.isEmpty && passwordError.isEmpty;
  bool get isStudent => index == 0;

  // For Student
  String _studentEmail;
  String get studentEmail => _studentEmail;
  String _studentPassword;
  String get studentPassword => _studentPassword;

  // For teacher
  String _teacherEmail;
  String get teacherEmail => _teacherEmail;
  String _teacherPassword;
  String get teacherPassword => _teacherPassword;

  updateEmail(String email) {
    if (isStudent) {
      _studentEmail = email;
      emailError = validateEmail(email);
    }
    //
    else {
      _teacherEmail = email;
      emailError = validateEmail(email);
    }

    notifyListeners();
  }

  updatePassword(String password) {
    if (isStudent) {
      _studentPassword = password;
      passwordError = validatePassword(password);
    }
    //
    else {
      _teacherPassword = password;
      passwordError = validatePassword(password);
    }

    notifyListeners();
  }

  void handleLogin() async {
    if (!result) {
      return;
    }

    setBusy(true);

    var authResult = await _authenticationService.loginUser(
      email: isStudent ? _studentEmail : _teacherEmail,
      password: isStudent ? _studentPassword : _teacherPassword,
    );

    setBusy(false);

    if (authResult is bool) {
      if (authResult) {
        _navigationService.navigateTo(Routes.mainViewRoute);
      } else {
        _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          icon: Icon(
            infoIcon,
            color: errorColor,
          ),
          backgroundColor: surfaceColor,
          title: commonErrorTitle,
          message: commonErrorInfo,
        );
      }
    } else {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 5),
        icon: Icon(
          infoIcon,
          color: errorColor,
        ),
        backgroundColor: surfaceColor,
        title: commonErrorTitle,
        message: commonErrorInfo,
      );
    }
  }

  gotoSignup() {
    _navigationService.navigateTo(Routes.signUpViewRoute);
  }

  continueAsGuest() {
    //TODO: Implement guest sign in
  }

  Future<bool> onWillPop() async {
    await _snackbarService.showCustomSnackBar(
        title: confirmExitInfo,
        duration: Duration(seconds: 5),
        message: confirmExitMessage,
        backgroundColor: surfaceColor,
        mainButton: FlatButton(
          textColor: textPrimaryColor,
          onPressed: () {
            exit(0);
          },
          child: Text("Yes"),
        ));

    return false;
  }
}
