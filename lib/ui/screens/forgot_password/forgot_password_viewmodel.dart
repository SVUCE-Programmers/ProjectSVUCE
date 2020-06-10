import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/utils/validators.dart';

class ForgotPasswordViewModel extends BaseViewModel with Validators {
  final AuthService _authenticationService = locator<AuthService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String emailError = '';

  String _email;
  String get email => _email;

  bool get result => emailError.isEmpty;

  updateEmail(String email) {
    _email = email;
    emailError = validateEmail(email);
    notifyListeners();
  }

  void resetPassword() async {
    if (!result) {
      return null;
    }

    setBusy(true);

    var resetPasswordResult = await _authenticationService.resetPassword(email);

    if (resetPasswordResult is String) {
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
    } else {
      _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 5),
        title: successEmailSentTitle,
        backgroundColor: surfaceColor,
        icon: Icon(
          doneIcon,
          color: primaryColor,
        ),
        message: successEmailSentInfo,
      );
    }

    setBusy(false);
  }

  goBack() {
    _navigationService.back();
  }
}
