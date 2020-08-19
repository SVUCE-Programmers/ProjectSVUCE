import 'package:auto_route/auto_route_annotations.dart';
import 'package:svuce_app/ui/screens/calender_events/event_detail.dart';
import 'package:svuce_app/ui/screens/create_profile/create_profile_view.dart';
import 'package:svuce_app/ui/screens/entry/entry_view.dart';
import 'package:svuce_app/ui/screens/forgot_password/forgot_password_view.dart';
import 'package:svuce_app/ui/screens/login/login_view.dart';
import 'package:svuce_app/ui/screens/main/main_view.dart';
import 'package:svuce_app/ui/screens/notifications/notifications_view.dart';
import 'package:svuce_app/ui/screens/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/signup/signup_view.dart';
import 'package:svuce_app/ui/screens/startup/startup_view.dart';
import 'package:svuce_app/ui/screens/time_table/time_table_view.dart';
import 'package:svuce_app/ui/screens/user_profile/user_profile_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: EntryView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: ForgotPasswordView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: CreateProfileView),
  MaterialRoute(page: SelectClubsView),
  MaterialRoute(page: MainView),
  MaterialRoute(page: UserProfileView),
  MaterialRoute(page: TimeTableView),
  MaterialRoute(page: NotificationsView),
  MaterialRoute(page: EventDetailsView),
])
class $Router {}
