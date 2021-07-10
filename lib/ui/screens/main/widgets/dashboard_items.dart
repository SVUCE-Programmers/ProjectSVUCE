import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/setupSnackbarUi.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/services/github_api_services.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/Static%20Pages/campus%20map/campus_map_view.dart';
import 'package:svuce_app/ui/screens/calender_events/events_view.dart';
import 'package:svuce_app/ui/screens/feed/feed_view.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view.dart';
import 'package:svuce_app/ui/screens/staff/staff_view.dart';
import 'package:svuce_app/ui/widgets/gridmenu_item.dart';

final NavigationService _navigationService = locator<NavigationService>();
final GithubApiServices _githubApiServices = GithubApiServices();
final AuthService _authService = locator<AuthService>();
final SnackbarService _snackbarService = locator<SnackbarService>();

final List<SpotlightItem> spotLightItems = [
  SpotlightItem(
    onTap: () => _authService.isGuest
        ? _snackbarService.showCustomSnackBar(
            duration: Duration(seconds: 2),
            title: "No Access",
            variant: SnackBarType.info,
            message: "Sorry only students of svuce can access this.",
          )
        : _navigationService.navigateWithTransition(
            SelectClubsView(
              isSelectClubs: false,
            ),
            transition: "rightToLeftWithFade"),
    icon: clubsIcon,
    name: "Explore Clubs",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(
        GithubPageView(
          url: _githubApiServices.programUrl,
          extensionUrl: _githubApiServices.rawGithubUrl,
        ),
        transition: "fade",
        duration: Duration(milliseconds: 900)),
    icon: FlutterIcons.library_mco,
    name: "Library",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(StaffView(),
        duration: Duration(seconds: 01), transition: "rightToLeftWithFade"),
    icon: facultyIcon,
    name: "Faculty",
  ),
  SpotlightItem(
    onTap: () => _authService.isGuest
        ? _snackbarService.showCustomSnackBar(
            duration: Duration(seconds: 2),
            title: "No Access",
            variant: SnackBarType.info,
            message: "Sorry only students of svuce can access this.",
          )
        : _navigationService.navigateWithTransition(FeedView(),
            duration: Duration(milliseconds: 900),
            transition: "rightToLeftWithFade"),
    icon: FlutterIcons.news_ent,
    name: "Feed",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(CampusMapView(),
        duration: Duration(milliseconds: 900),
        transition: "rightToLeftWithFade"),
    icon: campusIcon,
    name: "Campus Map",
  ),
  SpotlightItem(
    onTap: () => _authService.isGuest
        ? _snackbarService.showCustomSnackBar(
            duration: Duration(seconds: 2),
            title: "No Access",
            variant: SnackBarType.info,
            message: "Sorry only students of svuce can access this.",
          )
        : _navigationService.navigateWithTransition(CalenderEventsView(),
            duration: Duration(seconds: 01), transition: "rightToLeftWithFade"),
    icon: FlutterIcons.calendar_ant,
    name: "Event Calendar",
  ),
];
