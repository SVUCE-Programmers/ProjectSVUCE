import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/utils/validators.dart';

class SignUpViewModel extends BaseViewModel with Validators {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();

  final SnackbarService _snackbarService = locator<SnackbarService>();

  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';

  String _email;
  String get email => _email;
  String _password;
  String get password => _password;
  String _confirmPassword;
  String get confirmPassword => _confirmPassword;

  bool get result =>
      emailError.isEmpty &&
      passwordError.isEmpty &&
      confirmPasswordError.isEmpty;

  updateEmail(String email) {
    _email = email;
    emailError = validateEmail(email);
    notifyListeners();
  }

  updatePassword(String password) {
    _password = password;
    passwordError = validatePassword(password);
    notifyListeners();
  }

  updateConfirmPassword(String confirmPassword) {
    _confirmPassword = confirmPassword;
    confirmPasswordError = validatePassword(confirmPassword);
    notifyListeners();
  }

  handleSignup() async {
    if (!result) {
      return null;
    }

    if (password != confirmPassword) {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 5),
        icon: Icon(
          infoIcon,
          color: errorColor,
        ),
        backgroundColor: surfaceColor,
        title: commonErrorTitle,
        message: passwordMatchErrorInfo,
      );

      return null;
    }

    setBusy(true);

    //TODO: Do an API Call to make sure the user email is available

    var authResult = await _authService.loginUser(
      email: email,
      password: password,
    );

    setBusy(false);

    if (authResult is bool) {
      if (authResult) {
        // If User exists with email shows error
        await _authService.signOut();

        _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          icon: Icon(
            infoIcon,
            color: errorColor,
          ),
          backgroundColor: surfaceColor,
          title: commonErrorTitle,
          message: "Your account already exists, try logging in",
        );
      } else {
        _navigationService.navigateTo(Routes.createProfileViewRoute,
            arguments:
                CreateProfileViewArguments(email: email, password: password));
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

  gotoLogin() {
    _navigationService.back();
  }
}
