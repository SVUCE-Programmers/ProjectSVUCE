import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/push_notification_service.dart';
import 'package:svuce_app/app/router.gr.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final PushNotificationService _notificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic() async {
    await _notificationService.initialise();

    var userLoggedIn = await _authenticationService.isUserLoggedIn();

    if (userLoggedIn) {
      _navigationService.navigateTo(Routes.homeViewRoute);
    } else {
      _navigationService.navigateTo(Routes.entryViewRoute);
    }
  }
}
