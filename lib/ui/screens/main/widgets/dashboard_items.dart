import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/services/github_api_services.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/calender_events/events_view.dart';
import 'package:svuce_app/ui/screens/feed/feed_view.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view.dart';
import 'package:svuce_app/ui/screens/staff/staff_view.dart';
import 'package:svuce_app/ui/widgets/gridmenu_item.dart';

final NavigationService _navigationService = locator<NavigationService>();
final GithubApiServices _githubApiServices = GithubApiServices();
final AuthService _authService = locator<AuthService>();

final List<SpotlightItem> spotLightItems = [
  SpotlightItem(
    onTap: () => _authService.isGuest
        ? showToast("Sorry only students of svuce can access this.",
            backgroundColor: Colors.red)
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
        ? showToast("Sorry only students of svuce can access this.",
            backgroundColor: Colors.red)
        : _navigationService.navigateWithTransition(FeedView(),
            duration: Duration(seconds: 01), transition: "rightToLeftWithFade"),
    icon: feedIcon,
    name: "Feed",
  ),
  SpotlightItem(
    icon: FlutterIcons.video_fea,
    name: "Video Call",
  ),
  SpotlightItem(
    onTap: () => _navigationService.navigateWithTransition(CalenderEventsView(),
        duration: Duration(seconds: 01), transition: "rightToLeftWithFade"),
    icon: eventsIcon,
    name: "Event Calendar",
  ),
];
