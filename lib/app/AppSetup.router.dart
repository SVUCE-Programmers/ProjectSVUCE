// GENERATED CODE - DO NOT MODIFY BY HAND

//
// StackedRouterGenerator
//

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../core/models/club/club.dart';
import '../core/models/event/event.dart';
import '../core/models/feed/feed.dart';
import '../ui/screens/Club%20Pages/Club%20Details%20Page/club_details_page.dart';
import '../ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import '../ui/screens/admin%20screens/add_edit_time_table/add_edit_time_table.dart';
import '../ui/screens/admin%20screens/add_students_view/add_student_view.dart';
import '../ui/screens/admin%20screens/attendance_staff_view/attendance_staff_view.dart';
import '../ui/screens/admin%20screens/create%20event/create_event_view.dart';
import '../ui/screens/admin%20screens/create%20post/create_post_view.dart';
import '../ui/screens/attendance_manager/attendance_manager_view.dart';
import '../ui/screens/calender_events/event%20details/event_detail.dart';
import '../ui/screens/calender_events/events_view.dart';
import '../ui/screens/entry/entry_view.dart';
import '../ui/screens/forgot_password/forgot_password_view.dart';
import '../ui/screens/github%20pages/Resource%20Viewer/resource_viewer.dart';
import '../ui/screens/github%20pages/github_page_view.dart';
import '../ui/screens/login/login_view.dart';
import '../ui/screens/main/main_view.dart';
import '../ui/screens/notifications/notifications_view.dart';
import '../ui/screens/placements/placements_view.dart';
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
  static const String selectClubsView = '/select-clubs-view';
  static const String mainView = '/main-view';
  static const String eventDetailsView = '/event-details-view';
  static const String userProfileView = '/user-profile-view';
  static const String timeTableView = '/time-table-view';
  static const String notificationsView = '/notifications-view';
  static const String addStudentView = '/add-student-view';
  static const String addEditTimeTableView = '/add-edit-time-table-view';
  static const String attendanceStaffView = '/attendance-staff-view';
  static const String placementView = '/placement-view';
  static const String createEventView = '/create-event-view';
  static const String createPost = '/create-post';
  static const String calenderEventsView = '/calender-events-view';
  static const String attendanceManagerView = '/attendance-manager-view';
  static const String clubDetaislPageView = '/club-detaisl-page-view';
  static const String githubPageView = '/github-page-view';
  static const String resourceViewer = '/resource-viewer';
  static const all = <String>{
    startUpView,
    entryView,
    loginView,
    forgotPasswordView,
    signUpView,
    selectClubsView,
    mainView,
    eventDetailsView,
    userProfileView,
    timeTableView,
    notificationsView,
    addStudentView,
    addEditTimeTableView,
    attendanceStaffView,
    placementView,
    createEventView,
    createPost,
    calenderEventsView,
    attendanceManagerView,
    clubDetaislPageView,
    githubPageView,
    resourceViewer,
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
    RouteDef(Routes.eventDetailsView, page: EventDetailsView),
    RouteDef(Routes.userProfileView, page: UserProfileView),
    RouteDef(Routes.timeTableView, page: TimeTableView),
    RouteDef(Routes.notificationsView, page: NotificationsView),
    RouteDef(Routes.eventDetailsView, page: EventDetailsView),
    RouteDef(Routes.addStudentView, page: AddStudentView),
    RouteDef(Routes.addEditTimeTableView, page: AddEditTimeTableView),
    RouteDef(Routes.attendanceStaffView, page: AttendanceStaffView),
    RouteDef(Routes.placementView, page: PlacementView),
    RouteDef(Routes.createEventView, page: CreateEventView),
    RouteDef(Routes.createPost, page: CreatePost),
    RouteDef(Routes.calenderEventsView, page: CalenderEventsView),
    RouteDef(Routes.attendanceManagerView, page: AttendanceManagerView),
    RouteDef(Routes.clubDetaislPageView, page: ClubDetaislPageView),
    RouteDef(Routes.githubPageView, page: GithubPageView),
    RouteDef(Routes.resourceViewer, page: ResourceViewer),
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
    EventDetailsView: (data) {
      var args = data.getArgs<EventDetailsViewArguments>(
        orElse: () => EventDetailsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => EventDetailsView(
          key: args.key,
          event: args.event,
          id: args.id,
        ),
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
    AddStudentView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddStudentView(),
        settings: data,
      );
    },
    AddEditTimeTableView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddEditTimeTableView(),
        settings: data,
      );
    },
    AttendanceStaffView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AttendanceStaffView(),
        settings: data,
      );
    },
    PlacementView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlacementView(),
        settings: data,
      );
    },
    CreateEventView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CreateEventView(),
        settings: data,
      );
    },
    CreatePost: (data) {
      var args = data.getArgs<CreatePostArguments>(
        orElse: () => CreatePostArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CreatePost(
          key: args.key,
          feed: args.feed,
        ),
        settings: data,
      );
    },
    CalenderEventsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CalenderEventsView(),
        settings: data,
      );
    },
    AttendanceManagerView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AttendanceManagerView(),
        settings: data,
      );
    },
    ClubDetaislPageView: (data) {
      var args = data.getArgs<ClubDetaislPageViewArguments>(
        orElse: () => ClubDetaislPageViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ClubDetaislPageView(
          key: args.key,
          club: args.club,
        ),
        settings: data,
      );
    },
    GithubPageView: (data) {
      var args = data.getArgs<GithubPageViewArguments>(
        orElse: () => GithubPageViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => GithubPageView(
          key: args.key,
          url: args.url,
          extensionUrl: args.extensionUrl,
          title: args.title,
        ),
        settings: data,
      );
    },
    ResourceViewer: (data) {
      var args = data.getArgs<ResourceViewerArguments>(
        orElse: () => ResourceViewerArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ResourceViewer(
          key: args.key,
          urlLink: args.urlLink,
          title: args.title,
        ),
        settings: data,
      );
    },
  };
}

///
/// Arguments holder classes
///

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
  final String id;
  EventDetailsViewArguments({this.key, this.event, this.id});
}

/// CreatePost arguments holder class
class CreatePostArguments {
  final Key key;
  final Feed feed;
  CreatePostArguments({this.key, this.feed});
}

/// ClubDetaislPageView arguments holder class
class ClubDetaislPageViewArguments {
  final Key key;
  final Club club;
  ClubDetaislPageViewArguments({this.key, this.club});
}

/// GithubPageView arguments holder class
class GithubPageViewArguments {
  final Key key;
  final String url;
  final String extensionUrl;
  final String title;
  GithubPageViewArguments({this.key, this.url, this.extensionUrl, this.title});
}

/// ResourceViewer arguments holder class
class ResourceViewerArguments {
  final Key key;
  final String urlLink;
  final String title;
  ResourceViewerArguments({this.key, this.urlLink, this.title});
}
