import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/mixins/snackbar_helper.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/mixins/validators.dart';

class ForgotPasswordViewModel extends BaseViewModel
    with Validators, SnackbarHelper {
  final AuthService _authenticationService = locator<AuthService>();
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
      showErrorMessage(
        title: commonErrorTitle,
        message: commonErrorInfo,
      );
    } else {
      showSuccessMessage(
          title: successEmailSentTitle, message: successEmailSentInfo);
    }

    setBusy(false);
  }

  goBack() {
    _navigationService.back();
  }
}
