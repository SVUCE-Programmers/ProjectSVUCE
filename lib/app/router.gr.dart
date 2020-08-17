// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:svuce_app/ui/screens/startup/startup_view.dart';
import 'package:svuce_app/ui/screens/entry/entry_view.dart';
import 'package:svuce_app/ui/screens/login/login_view.dart';
import 'package:svuce_app/ui/screens/forgot_password/forgot_password_view.dart';
import 'package:svuce_app/ui/screens/signup/signup_view.dart';
import 'package:svuce_app/ui/screens/create_profile/create_profile_view.dart';
import 'package:svuce_app/ui/screens/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/main/main_view.dart';
import 'package:svuce_app/ui/screens/user_profile/user_profile_view.dart';
import 'package:svuce_app/ui/screens/time_table/time_table_view.dart';
import 'package:svuce_app/ui/screens/notifications/notifications_view.dart';
import 'package:svuce_app/ui/screens/calender_events/event_detail.dart';
import 'package:svuce_app/core/models/event/event.dart';

abstract class Routes {
  static const startUpViewRoute = '/';
  static const entryViewRoute = '/entry-view-route';
  static const loginViewRoute = '/login-view-route';
  static const forgotPasswordViewRoute = '/forgot-password-view-route';
  static const signUpViewRoute = '/sign-up-view-route';
  static const createProfileViewRoute = '/create-profile-view-route';
  static const selectClubsViewRoute = '/select-clubs-view-route';
  static const mainViewRoute = '/main-view-route';
  static const userProfileViewRoute = '/user-profile-view-route';
  static const timeTableViewRoute = '/time-table-view-route';
  static const notificationsViewRoute = '/notifications-view-route';
  static const eventDetailsView = '/event-details-view';
  static const all = {
    startUpViewRoute,
    entryViewRoute,
    loginViewRoute,
    forgotPasswordViewRoute,
    signUpViewRoute,
    createProfileViewRoute,
    selectClubsViewRoute,
    mainViewRoute,
    userProfileViewRoute,
    timeTableViewRoute,
    notificationsViewRoute,
    eventDetailsView,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.startUpViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => StartUpView(),
          settings: settings,
        );
      case Routes.entryViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => EntryView(),
          settings: settings,
        );
      case Routes.loginViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginView(),
          settings: settings,
        );
      case Routes.forgotPasswordViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ForgotPasswordView(),
          settings: settings,
        );
      case Routes.signUpViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpView(),
          settings: settings,
        );
      case Routes.createProfileViewRoute:
        if (hasInvalidArgs<CreateProfileViewArguments>(args)) {
          return misTypedArgsRoute<CreateProfileViewArguments>(args);
        }
        final typedArgs =
            args as CreateProfileViewArguments ?? CreateProfileViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => CreateProfileView(
              key: typedArgs.key,
              email: typedArgs.email,
              password: typedArgs.password),
          settings: settings,
        );
      case Routes.selectClubsViewRoute:
        if (hasInvalidArgs<SelectClubsViewArguments>(args)) {
          return misTypedArgsRoute<SelectClubsViewArguments>(args);
        }
        final typedArgs =
            args as SelectClubsViewArguments ?? SelectClubsViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => SelectClubsView(
              key: typedArgs.key, isSelectClubs: typedArgs.isSelectClubs),
          settings: settings,
        );
      case Routes.mainViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => MainView(),
          settings: settings,
        );
      case Routes.userProfileViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => UserProfileView(),
          settings: settings,
        );
      case Routes.timeTableViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => TimeTableView(),
          settings: settings,
        );
      case Routes.notificationsViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => NotificationsView(),
          settings: settings,
        );
      case Routes.eventDetailsView:
        if (hasInvalidArgs<EventDetailsViewArguments>(args)) {
          return misTypedArgsRoute<EventDetailsViewArguments>(args);
        }
        final typedArgs =
            args as EventDetailsViewArguments ?? EventDetailsViewArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              EventDetailsView(key: typedArgs.key, event: typedArgs.event),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//CreateProfileView arguments holder class
class CreateProfileViewArguments {
  final Key key;
  final String email;
  final String password;
  CreateProfileViewArguments({this.key, this.email, this.password});
}

//SelectClubsView arguments holder class
class SelectClubsViewArguments {
  final Key key;
  final bool isSelectClubs;
  SelectClubsViewArguments({this.key, this.isSelectClubs});
}

//EventDetailsView arguments holder class
class EventDetailsViewArguments {
  final Key key;
  final Event event;
  EventDetailsViewArguments({this.key, this.event});
}
