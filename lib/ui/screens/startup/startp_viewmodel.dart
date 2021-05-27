import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/assets.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/app/AppSetup.router.dart';

import 'package:svuce_app/core/services/dynamic_links/dynamic_links.dart';
import 'package:svuce_app/core/services/one_signal_service.dart';

class StartUpViewModel extends BaseViewModel {
  final AuthService _authenticationService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final OneSignalService _notificationService =
      OneSignalService();
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
  final UsersRepository _usersRepository = locator<UsersRepository>();

  Future handleStartUpLogic(BuildContext context) async {
    await precacheImage(AssetImage(hexagonPattern), context);
    await _dynamicLinkService.handleDynamicLinks();
    await _notificationService.initialise();
    _usersRepository.getUserDetailsFromPrefs();
    var userLoggedIn = _authenticationService.isUserLoggedIn();

    if (userLoggedIn) {
      _navigationService.navigateTo(Routes.mainView);
    } else {
      _navigationService.navigateTo(Routes.entryView);
    }
  }
}
