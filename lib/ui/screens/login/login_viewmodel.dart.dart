import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/AppSetup.router.dart';

import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/core/mixins/validators.dart';
import 'package:svuce_app/core/services/firebaseAnalyticsService.dart';
import 'package:svuce_app/ui/screens/forgot_password/forgot_password_view.dart';
import 'package:svuce_app/ui/screens/main/main_view.dart';

class LoginViewModel extends BaseViewModel with Validators, SnackbarHelper {
  final log = getLogger("Login View Model");
  final AuthService _authenticationService = locator<AuthService>();

  final NavigationService _navigationService = locator<NavigationService>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() async {
    bool result = emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty;
    log.i(result);

    if (result) {
      showInfoMessage(
          title: commonErrorTitle,
          message: "Please check your details and try again");

      return;
    }

    setBusy(true);

    var authResult = await _authenticationService.loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    setBusy(false);

    if (authResult is bool && authResult) {
      _analyticsService.logLogin();

      _navigationService.navigateTo(Routes.mainView);
    } else {
      showCommonError();
    }
  }

  gotoSignup() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  continueAsGuest() {
    _analyticsService.logGuestSignin();
    _navigationService.navigateWithTransition(MainView(), transition: "fade");
  }

  showCommonError() {
    showErrorMessage(
      title: commonErrorTitle,
      message: commonErrorInfo,
    );
  }

  navigateToForgotPassword() {
    _navigationService.navigateWithTransition(ForgotPasswordView(),
        transition: "fade");
  }
}
