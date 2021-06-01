import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/dataset.dart';
import 'package:svuce_app/core/models/graph.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/services/theme_service.dart';
import 'package:svuce_app/hive_db/models/attendance.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';
import 'package:svuce_app/ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view.dart';
import 'package:svuce_app/ui/screens/time_table/time_table_view.dart';
import 'package:svuce_app/ui/screens/Static Pages/about_college/about_college_view.dart';
import 'package:svuce_app/ui/screens/Static Pages/About App/about_app_view.dart';
import '../../screens/admin screens/attendance_staff_view/attendance_staff_view.dart';
import '../attendance_manager/attendance_manager_view.dart';

class MainViewModel extends BaseViewModel {
  final log = getLogger("MainViewModel");
  final UsersRepository _userRepository = locator<UsersRepository>();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  final NavigationService _navigationService = locator<NavigationService>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService _authService = locator<AuthService>();
  final ThemeService _themeService = locator<ThemeService>();
  final AttendanceService _attendanceService = locator<AttendanceService>();
  List<Attendance> attendanceList = [];
  List<String> subjects = [];
  UserModel _currentUser;
  bool get isDarkMode => _themeService.isDarkMode;
  UserModel get currentUser => _currentUser;
  String get name => _firebaseAuth.currentUser?.displayName;
  String get userImage => _firebaseAuth.currentUser?.photoURL;

  String getGreeting() {
    var h = DateTime.now().hour;
    if (h < 12) {
      return "Good Morning";
    } else if (h < 17) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  getCurrentUserDetails() {
    _userRepository
        .getUserFromStream(_firebaseAuth.currentUser.email)
        .listen((event) {
      if (event != null) {
        _currentUser = event;
        _firebaseAuth.currentUser.updateProfile(
            displayName: _currentUser.fullName,
            photoURL: _currentUser.profileImg);
        notifyListeners();
      }
    });
  }

  init() {
    listenAttendanceStream();
    getCurrentUserDetails();
    getAttendanceData();
  }

  getGraph() {
    List<double> temp = [];
    attendanceList.asMap().forEach((key, value) {
      if (value.total == 0) {
        temp.add(0);
      } else {
        temp.add(
            double.parse((value.present / value.total).toStringAsFixed(3)));
      }
    });
    log.d(temp);
    DataSet dataSet = DataSet(
      temp,
    );
    Graph graph = Graph([
      dataSet,
    ], "", "%");
    graph.domainStart = 0;
    graph.domainEnd = temp.length >= 4 ? 4.0 : temp.length.toDouble();
    graph.rangeStart = 0;
    graph.rangeEnd = 11;
    graph.selectedDataPoint = 1;
    return graph;
  }

  toggleTheme() async {
    await _themeService.changeTheme();
    notifyListeners();
  }

  //?Navigation Functions
  navigateToTimeTable() {
    _navigationService.navigateWithTransition(TimeTableView(),
        transition: "rightToLeftWithFade",
        duration: Duration(milliseconds: 900));
  }

  navigateToAttendance() {
    bool isStaff = false;
    if (isStaff) {
      _navigationService.navigateWithTransition(AttendanceStaffView(),
          transition: "rightToLeftWithFade",
          duration: Duration(milliseconds: 900));
    } else {
      _navigationService.navigateWithTransition(AttendanceManagerView(),
          transition: "rightToLeftWithFade",
          duration: Duration(milliseconds: 900));
    }
  }

  navigateToAddStudent() {
    _navigationService.navigateWithTransition(AddStudentView(),
        transition: "rightToLeftWithFade",
        duration: Duration(milliseconds: 900));
  }

  navigateToAboutCollege() {
    _navigationService.navigateWithTransition(AboutCollegeView(),
        transition: "fade", duration: Duration(milliseconds: 900));
  }

  navigateToAboutApp() {
    _navigationService.navigateWithTransition(AboutAppView(),
        transition: "fade", duration: Duration(milliseconds: 900));
  }

  navigateToExploreClubs() {
    _navigationService.navigateWithTransition(
        SelectClubsView(
          isSelectClubs: false,
        ),
        transition: "fade",
        duration: Duration(milliseconds: 900));
  }

  logout() async {
    setBusy(true);
    await _authService.signOut();
    setBusy(false);
  }

  getAttendanceData() async {
    await _attendanceService.init();
    notifyListeners();
  }

  listenAttendanceStream() {
    _attendanceService.getAttendanceStream().listen((event) {
      attendanceList = event;
      attendanceList.asMap().forEach((key, value) {
        subjects.add(value.subject);
        notifyListeners();
      });
      notifyListeners();
    });
  }
}
