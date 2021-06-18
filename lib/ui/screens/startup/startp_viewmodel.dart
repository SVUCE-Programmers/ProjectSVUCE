import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/assets.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/app/AppSetup.router.dart';
import 'package:svuce_app/core/services/connectivity%20service/connectivity_services.dart';

import 'package:svuce_app/core/services/dynamic_links/dynamic_links.dart';
import 'package:svuce_app/core/services/firebaseAnalyticsService.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:svuce_app/ui/screens/Static%20Pages/onboard%20screens/onboard_view.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger("Startup View Model");
  final AuthService _authenticationService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final DynamicLinkService _dynamicLinkService = locator<DynamicLinkService>();
  final UsersRepository _usersRepository = locator<UsersRepository>();
  final AnalyticsService _analyticsService = locator<AnalyticsService>();
  final ShareService _shareService = locator<ShareService>();
  final ConnectivityServices _connectivityServices =
      locator<ConnectivityServices>();
  bool isLottieLoaded = false;

  changeToLoaded() {
    isLottieLoaded = true;
    notifyListeners();
  }

  Future handleStartUpLogic(BuildContext context) async {
    _authenticationService.listenAuthStatusStream();
    _connectivityServices.initializeConnectionService();
    _analyticsService.logAppOpen();
    _shareService.initFlutterDownload();
    await precacheImage(AssetImage(hexagonPattern), context);
    await _dynamicLinkService.handleDynamicLinks();
    _shareService.initFlutterDownload();
    var userLoggedIn = _authenticationService.isUserLoggedIn();
    log.i("User Login Status is:$userLoggedIn");
    if (userLoggedIn) {
      _usersRepository.getUserDetailsFromPrefs();
      _navigationService.navigateTo(Routes.mainView);
    } else {
      _navigationService.navigateToView(OnBoardView());
    }
  }
}
