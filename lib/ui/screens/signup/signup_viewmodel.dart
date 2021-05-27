import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/app/AppSetup.router.dart';

import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/mixins/validators.dart';

class SignUpViewModel extends BaseViewModel with Validators, SnackbarHelper {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final UsersRepository _usersRepository = locator<UsersRepository>();

  bool isEmailVerified = false;

  String emailError = '';
  String passwordError = '';
  String confirmPasswordError = '';

  String _email;
  String get email => _email;
  String _password;
  String get password => _password;
  String _confirmPassword;
  String get confirmPassword => _confirmPassword;
  changeEmailVerified() {
    isEmailVerified = !isEmailVerified;
    notifyListeners();
  }

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
      showInfoMessage(
        title: commonErrorTitle,
        message: passwordMatchErrorInfo,
      );

      return null;
    }
    if (isEmailVerified) {
      setBusy(true);
      var result = await _authService.createStudent(
        email: _email,
        password: _password,
      );

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
        email,
      );

      setBusy(false);

      if (authResult is bool && authResult) {
        isEmailVerified = true;
        notifyListeners();
      } else {
        showErrorMessage(
            title: "Error Occured",
            message: "Please try again or contact administration");
      }
    }
  }

  gotoLogin() {
    _navigationService.back();
  }

  gotoProfile() {
    _navigationService.navigateTo(Routes.createProfileView,
        arguments:
            CreateProfileViewArguments(email: email, password: password));
  }
}
