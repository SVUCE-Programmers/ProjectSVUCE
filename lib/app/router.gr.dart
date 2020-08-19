// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/models/event/event.dart';
import '../ui/screens/calender_events/event_detail.dart';
import '../ui/screens/create_profile/create_profile_view.dart';
import '../ui/screens/entry/entry_view.dart';
import '../ui/screens/forgot_password/forgot_password_view.dart';
import '../ui/screens/login/login_view.dart';
import '../ui/screens/main/main_view.dart';
import '../ui/screens/notifications/notifications_view.dart';
import '../ui/screens/select_clubs/select_clubs_view.dart';
import '../ui/screens/signup/signup_view.dart';
import '../ui/screens/startup/startup_view.dart';
import '../ui/screens/time_table/time_table_view.dart';
import '../ui/screens/user_profile/user_profile_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String entryView = '/entry-view';
  static const String loginView = '/login-view';
  static const String forgotPasswordView = '/forgot-password-view';
  static const String signUpView = '/sign-up-view';
  static const String createProfileView = '/create-profile-view';
  static const String selectClubsView = '/select-clubs-view';
  static const String mainView = '/main-view';
  static const String userProfileView = '/user-profile-view';
  static const String timeTableView = '/time-table-view';
  static const String notificationsView = '/notifications-view';
  static const String eventDetailsView = '/event-details-view';
  static const all = <String>{
    startUpView,
    entryView,
    loginView,
    forgotPasswordView,
    signUpView,
    createProfileView,
    selectClubsView,
    mainView,
    userProfileView,
    timeTableView,
    notificationsView,
    eventDetailsView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.entryView, page: EntryView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.createProfileView, page: CreateProfileView),
    RouteDef(Routes.selectClubsView, page: SelectClubsView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.userProfileView, page: UserProfileView),
    RouteDef(Routes.timeTableView, page: TimeTableView),
    RouteDef(Routes.notificationsView, page: NotificationsView),
    RouteDef(Routes.eventDetailsView, page: EventDetailsView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    EntryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => EntryView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    ForgotPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgotPasswordView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    CreateProfileView: (data) {
      final args = data.getArgs<CreateProfileViewArguments>(
        orElse: () => CreateProfileViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreateProfileView(
          key: args.key,
          email: args.email,
          password: args.password,
        ),
        settings: data,
      );
    },
    SelectClubsView: (data) {
      final args = data.getArgs<SelectClubsViewArguments>(
        orElse: () => SelectClubsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectClubsView(
          key: args.key,
          isSelectClubs: args.isSelectClubs,
        ),
        settings: data,
      );
    },
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainView(),
        settings: data,
      );
    },
    UserProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserProfileView(),
        settings: data,
      );
    },
    TimeTableView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => TimeTableView(),
        settings: data,
      );
    },
    NotificationsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NotificationsView(),
        settings: data,
      );
    },
    EventDetailsView: (data) {
      final args = data.getArgs<EventDetailsViewArguments>(
        orElse: () => EventDetailsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventDetailsView(
          key: args.key,
          event: args.event,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CreateProfileView arguments holder class
class CreateProfileViewArguments {
  final Key key;
  final String email;
  final String password;
  CreateProfileViewArguments({this.key, this.email, this.password});
}

/// SelectClubsView arguments holder class
class SelectClubsViewArguments {
  final Key key;
  final bool isSelectClubs;
  SelectClubsViewArguments({this.key, this.isSelectClubs});
}

/// EventDetailsView arguments holder class
class EventDetailsViewArguments {
  final Key key;
  final Event event;
  EventDetailsViewArguments({this.key, this.event});
}
