import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/base_auth.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/services/push_notification_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<BaseAuth>();
  final NavigationService _navigationService = locator<NavigationService>();
  final PushNotificationService _notificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic() async {
    await _notificationService.initialise();

    var userLoggedIn = await _authenticationService.isUserLoggedIn();

    if (userLoggedIn) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(SelectUserViewRoute);
    }
  }
}
