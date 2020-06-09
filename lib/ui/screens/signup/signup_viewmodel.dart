import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/core/utils/validators.dart';

class SignUpViewModel extends BaseViewModel with Validators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> get formKey => _formKey;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final NavigationService _navigationService = locator<NavigationService>();

  final SnackbarService _snackbarService = locator<SnackbarService>();

  handleSignup() async {
    bool result = _formKey.currentState.validate();

    if (!result) {
      return null;
    }

    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

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
    await Future.delayed(Duration(seconds: 2));

    _navigationService.navigateTo(Routes.createProfileViewRoute,
        arguments:
            CreateProfileViewArguments(email: email, password: password));

    setBusy(false);
  }

  gotoLogin() {
    _navigationService.back();
  }
}
