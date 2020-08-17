import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/assets.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/core/services/push_notifications/push_notification_service.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthService _authenticationService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final PushNotificationService _notificationService =
      locator<PushNotificationService>();

  Future handleStartUpLogic(BuildContext context) async {
    await precacheImage(AssetImage(hexagonPattern), context);

    await _notificationService.initialise();

    var userLoggedIn = await _authenticationService.isUserLoggedIn();

    if (userLoggedIn) {
      _navigationService.navigateTo(Routes.mainViewRoute);
    } else {
      _navigationService.navigateTo(Routes.entryViewRoute);
    }
  }
}
