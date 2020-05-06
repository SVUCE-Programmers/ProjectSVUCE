import 'package:auto_route/auto_route_annotations.dart';
import 'package:svuce_app/ui/views/create_profile/create_profile_view.dart';
import 'package:svuce_app/ui/views/entry/entry_view.dart';
import 'package:svuce_app/ui/views/feed/feed_view.dart';
import 'package:svuce_app/ui/views/forgot_password/forgot_password_view.dart';
import 'package:svuce_app/ui/views/home/home_view.dart';
import 'package:svuce_app/ui/views/login/login_view.dart';
import 'package:svuce_app/ui/views/notifications/notifications_view.dart';
import 'package:svuce_app/ui/views/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/views/signup/signup_view.dart';
import 'package:svuce_app/ui/views/startup/startup_view.dart';
import 'package:svuce_app/ui/views/time_table/time_table_view.dart';
import 'package:svuce_app/ui/views/user_profile/user_profile_view.dart';

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

  HomeView homeViewRoute;
  FeedView feedViewRoute;
  UserProfileView userProfileViewRoute;
  TimeTableView timeTableViewRoute;
  NotificationsView notificationsViewRoute;
}
