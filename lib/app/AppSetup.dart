import 'package:stacked/stacked_annotations.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/Club%20Details%20Page/club_details_page.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/Static%20Pages/campus%20map/campus_map_view.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_edit_time_table/add_edit_time_table.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view.dart';
import 'package:svuce_app/ui/screens/admin%20screens/attendance_staff_view/attendance_staff_view.dart';
import 'package:svuce_app/ui/screens/admin%20screens/create%20event/create_event_view.dart';
import 'package:svuce_app/ui/screens/admin%20screens/create%20post/create_post_view.dart';
import 'package:svuce_app/ui/screens/attendance_manager/attendance_manager_view.dart';
import 'package:svuce_app/ui/screens/calender_events/event%20details/event_detail.dart';
import 'package:svuce_app/ui/screens/calender_events/events_view.dart';
import 'package:svuce_app/ui/screens/entry/entry_view.dart';
import 'package:svuce_app/ui/screens/forgot_password/forgot_password_view.dart';
import 'package:svuce_app/ui/screens/github%20pages/Resource%20Viewer/resource_viewer.dart';
import 'package:svuce_app/ui/screens/github%20pages/github_page_view.dart';
import 'package:svuce_app/ui/screens/login/login_view.dart';
import 'package:svuce_app/ui/screens/main/consumers/imports.dart';
import 'package:svuce_app/ui/screens/main/main_view.dart';
import 'package:svuce_app/ui/screens/notifications/notifications_view.dart';
import 'package:svuce_app/ui/screens/placements/placements_view.dart';
import 'package:svuce_app/ui/screens/signup/signup_view.dart';
import 'package:svuce_app/ui/screens/startup/startup_view.dart';
import 'package:svuce_app/ui/screens/time_table/time_table_view.dart';
import 'package:svuce_app/ui/screens/user_profile/user_profile_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: EntryView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: ForgotPasswordView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: SelectClubsView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: EventDetailsView),
    MaterialRoute(page: UserProfileView),
    MaterialRoute(page: TimeTableView),
    MaterialRoute(page: NotificationsView),
    MaterialRoute(page: EventDetailsView),
    MaterialRoute(page: AddStudentView),
    MaterialRoute(page: AddEditTimeTableView),
    MaterialRoute(page: AttendanceStaffView),
    MaterialRoute(page: PlacementView),
    MaterialRoute(page: CreateEventView),
    MaterialRoute(page: CreatePost),
    MaterialRoute(page: CalenderEventsView),
    MaterialRoute(page: AttendanceManagerView),
    MaterialRoute(page: ClubDetaislPageView),
    MaterialRoute(page: GithubPageView),
    MaterialRoute(page: ResourceViewer),
    MaterialRoute(page: CampusMapView),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
