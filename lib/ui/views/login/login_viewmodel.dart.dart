import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
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

  String validateEmail(String email) {
    RegExp reg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

    if (!reg.hasMatch(email)) {
      return 'Please enter a valid email';
    } else if (email.length < 5) {
      return 'Your email must be atleast 6';
    }
    return null;
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please Enter Your Password';
    } else if (password.length < 5) {
      return 'Your password must be atleast 6';
    }
    return null;
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
        _navigationService.navigateTo(Routes.createProfileViewRoute);
      } else {
        _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          icon: Icon(
            EvaIcons.info,
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
          EvaIcons.info,
          color: errorColor,
        ),
        backgroundColor: surfaceColor,
        title: commonErrorTitle,
        message: commonErrorInfo,
      );
    }
  }

  gotoSignup() {
    //TODO: Go to signup
  }

  continueAsGuest(){
    //TODO: Implement guest sign in
  }
}
