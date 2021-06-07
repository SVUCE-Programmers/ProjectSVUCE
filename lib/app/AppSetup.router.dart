// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/calender_events/event%20details/event_detail.dart';

import '../core/models/event/event.dart';
import '../ui/screens/admin%20screens/add_students_view/add_student_view.dart';
import '../ui/screens/entry/entry_view.dart';
import '../ui/screens/forgot_password/forgot_password_view.dart';
import '../ui/screens/login/login_view.dart';
import '../ui/screens/main/main_view.dart';
import '../ui/screens/notifications/notifications_view.dart';
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
  static const String addStudentView = '/add-student-view';
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
    addStudentView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.entryView, page: EntryView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.forgotPasswordView, page: ForgotPasswordView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.selectClubsView, page: SelectClubsView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.userProfileView, page: UserProfileView),
    RouteDef(Routes.timeTableView, page: TimeTableView),
    RouteDef(Routes.notificationsView, page: NotificationsView),
    RouteDef(Routes.eventDetailsView, page: EventDetailsView),
    RouteDef(Routes.addStudentView, page: AddStudentView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
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
    SelectClubsView: (data) {
      var args = data.getArgs<SelectClubsViewArguments>(
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
      var args = data.getArgs<EventDetailsViewArguments>(
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
    AddStudentView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddStudentView(),
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
  final void Function() share;
  EventDetailsViewArguments({this.key, this.event, this.share});
}
