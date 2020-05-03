// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:svuce_app/ui/views/startup/startup_view.dart';
import 'package:svuce_app/ui/views/home/home_view.dart';
import 'package:svuce_app/ui/views/entry/entry_view.dart';
import 'package:svuce_app/ui/views/create_profile/create_profile_view.dart';
import 'package:svuce_app/ui/views/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/views/user_profile/user_profile_view.dart';
import 'package:svuce_app/ui/views/time_table/time_table_view.dart';
import 'package:svuce_app/ui/views/notifications/notifications_view.dart';

abstract class Routes {
  static const startUpViewRoute = '/start-up-view-route';
  static const homeViewRoute = '/home-view-route';
  static const entryView = '/entry-view';
  static const createProfileView = '/create-profile-view';
  static const selectClubsView = '/select-clubs-view';
  static const userProfileView = '/user-profile-view';
  static const timeTableView = '/time-table-view';
  static const notificationsView = '/notifications-view';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.startUpViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartUpView(),
          settings: settings,
        );
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.entryView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => EntryView(),
          settings: settings,
        );
      case Routes.createProfileView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateProfileView(),
          settings: settings,
        );
      case Routes.selectClubsView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SelectClubsView(),
          settings: settings,
        );
      case Routes.userProfileView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => UserProfileView(),
          settings: settings,
        );
      case Routes.timeTableView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => TimeTableView(),
          settings: settings,
        );
      case Routes.notificationsView:
        return MaterialPageRoute<dynamic>(
          builder: (context) => NotificationsView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
