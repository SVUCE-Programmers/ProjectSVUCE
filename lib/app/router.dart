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

@MaterialAutoRouter()
class $Router {
  @initial
  StartUpView startUpViewRoute;

  EntryView entryViewRoute;
  LoginView loginViewRoute;
  ForgotPasswordView forgotPasswordViewRoute;
  SignUpView signUpViewRoute;
  CreateProfileView createProfileViewRoute;
  SelectClubsView selectClubsViewRoute;

  MainView mainViewRoute;
  UserProfileView userProfileViewRoute;
  TimeTableView timeTableViewRoute;
  NotificationsView notificationsViewRoute;
  EventDetailsView eventDetailsView;
}
