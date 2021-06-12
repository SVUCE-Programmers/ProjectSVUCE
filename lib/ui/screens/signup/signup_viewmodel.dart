import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/app/AppSetup.router.dart';

import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/mixins/validators.dart';

class SignUpViewModel extends BaseViewModel with Validators, SnackbarHelper {
  final log = getLogger("SignupViewModel");
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final UsersRepository _usersRepository = locator<UsersRepository>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool isEmailVerified = false;
  changeEmailVerified() {
    isEmailVerified = !isEmailVerified;
    notifyListeners();
  }

  handleSignup() async {
    if (passController.text != confirmPassController.text) {
      showInfoMessage(
        title: commonErrorTitle,
        message: passwordMatchErrorInfo,
      );

      return null;
    }
    if (isEmailVerified) {
      setBusy(true);
      var result = await _authService.createStudent(
          email: emailController.text, password: passController.text);
      setBusy(false);
      if (result is bool) {
        if (result) {
          _navigationService.navigateTo(Routes.selectClubsView,
              arguments: SelectClubsViewArguments(isSelectClubs: true));
        } else {
          showErrorMessage(title: commonErrorTitle, message: commonErrorInfo);
        }
      } else {
        showErrorMessage(title: commonErrorTitle, message: result);
      }
    } else {
      setBusy(true);
      var authResult = await _usersRepository.signupUser(
        emailController.text,
      );
      log.i("Result at Sign up User is:$authResult");
      setBusy(false);
      if (authResult is bool && authResult) {
        isEmailVerified = true;
        notifyListeners();
      }
    }
  }

  gotoLogin() {
    _navigationService.back();
  }
}
