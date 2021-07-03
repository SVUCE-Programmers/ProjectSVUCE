import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/showToastConfigs.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/mixins/validators.dart';
import 'package:svuce_app/ui/screens/main/consumers/imports.dart';

class ForgotPasswordViewModel extends BaseViewModel with Validators {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthService _authenticationService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController emailController = TextEditingController();
  void resetPassword() async {
    if (formKey.currentState.validate()) {
      setBusy(true);
      var resetPasswordResult =
          await _authenticationService.resetPassword(emailController.text);

      if (resetPasswordResult is String) {
        showErrorToast(
          commonErrorInfo,
        );
      } else {
        showSuccessToast(successEmailSentInfo);
      }

      setBusy(false);
    }
  }

  goBack() {
    _navigationService.back();
  }
}
