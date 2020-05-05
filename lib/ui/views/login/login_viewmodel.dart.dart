import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/services/auth_service.dart';

class LoginViewModel extends BaseViewModel {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final NavigationService _navigationService = locator<NavigationService>();

  final SnackbarService _snackbarService = locator<SnackbarService>();

  final popUpMenuItems = [
    "Forgot Password?",
    "FAQs",
  ];

  void handlePopUp(String value) async {
    if (value == popUpMenuItems[0]) {
      await _navigationService.navigateTo(Routes.forgotPasswordViewRoute);
    } else {
      //TODO: Go to FAQs Page
    }
  }

  void handleLogin() async {
    bool result = _formKey.currentState.validate();

    if (!result) {
      return null;
    }

    String email = emailController.text;
    String password = passwordController.text;

    setBusy(true);

    var authResult = await _authenticationService.loginUser(
        email: email, password: password);

    setBusy(false);

    if (authResult is bool) {
      if (authResult) {
        _navigationService.navigateTo(Routes.homeViewRoute);
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
        title: 'Exit',
        duration: Duration(seconds: 5),
        message: 'Are you sure to exit?',
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
