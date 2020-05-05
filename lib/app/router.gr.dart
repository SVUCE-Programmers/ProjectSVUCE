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
import 'package:svuce_app/ui/views/login/login_view.dart';
import 'package:svuce_app/ui/views/feed/feed_view.dart';
import 'package:svuce_app/ui/views/signup/signup_view.dart';
import 'package:svuce_app/ui/views/forgot_password/forgot_password_view.dart';

abstract class Routes {
  static const startUpViewRoute = '/start-up-view-route';
  static const homeViewRoute = '/home-view-route';
  static const entryViewRoute = '/entry-view-route';
  static const createProfileViewRoute = '/create-profile-view-route';
  static const selectClubsViewRoute = '/select-clubs-view-route';
  static const userProfileViewRoute = '/user-profile-view-route';
  static const timeTableViewRoute = '/time-table-view-route';
  static const notificationsViewRoute = '/notifications-view-route';
  static const loginViewRoute = '/login-view-route';
  static const feedViewRoute = '/feed-view-route';
  static const signUpViewRoute = '/sign-up-view-route';
  static const forgotPasswordViewRoute = '/forgot-password-view-route';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
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
      case Routes.homeViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomeView(),
          settings: settings,
        );
      case Routes.entryViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => EntryView(),
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
        return MaterialPageRoute<dynamic>(
          builder: (context) => SelectClubsView(),
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
      case Routes.loginViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginView(),
          settings: settings,
        );
      case Routes.feedViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => FeedView(),
          settings: settings,
        );
      case Routes.signUpViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SignUpView(),
          settings: settings,
        );
      case Routes.forgotPasswordViewRoute:
        return MaterialPageRoute<dynamic>(
          builder: (context) => ForgotPasswordView(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//CreateProfileView arguments holder class
class CreateProfileViewArguments {
  final Key key;
  final String email;
  final String password;
  CreateProfileViewArguments({this.key, this.email, this.password});
}
