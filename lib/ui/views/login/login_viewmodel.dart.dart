import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';

class LoginViewModel extends BaseViewModel {
  final popUpMenuItems = [
    "Forgot Password?",
    "FAQs",
  ];

  final NavigationService _navigationService = locator<NavigationService>();

  void handlePopUp(String value) async {
    if (value == popUpMenuItems[0]) {
      await _navigationService.navigateTo(Routes.forgotPasswordViewRoute);
    } else {
      //TODO: Go to FAQs Page
    }
  }
}
