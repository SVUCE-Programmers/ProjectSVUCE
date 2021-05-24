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
import 'package:svuce_app/ui/screens/Club%20Pages/select_clubs/select_clubs_view.dart';
import 'package:svuce_app/ui/screens/about_college/about_college_view.dart';
import 'package:svuce_app/ui/screens/admin%20screens/add_students_view/add_student_view.dart';
import 'package:svuce_app/ui/screens/attendance_manager/attendance_view.dart';
import 'package:svuce_app/ui/screens/time_table/time_table_view.dart';

class MainViewModel extends BaseViewModel {
  final log = getLogger("MainViewModel");
  final UsersRepository _userRepository = locator<UsersRepository>();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  final NavigationService _navigationService = locator<NavigationService>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  UserModel _currentUser;
  UserModel get currentUser => _currentUser;
  String get name => _firebaseAuth.currentUser.displayName;
  String get userImage => _firebaseAuth.currentUser.photoURL;

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
        .getUserFromStream(_firebaseAuth.currentUser.uid)
        .listen((event) {
      if (event != null) {
        _currentUser = event;
        notifyListeners();
      }
    });
  }

  getGraph() {
    DataSet dataSet = DataSet(
      [0.2, 0.4, 0.6, 0.3, 0.04],
    );
    Graph graph = Graph([
      dataSet,
    ], "", "%");
    graph.domainStart = 0;
    graph.domainEnd = 4;
    graph.rangeStart = 0;
    graph.rangeEnd = 10;
    graph.selectedDataPoint = 1;
    return graph;
  }

  //?Navigation Functions
  navigateToTimeTable() {
    _navigationService.navigateWithTransition(TimeTableView(),
        transition: "rightToLeftWithFade",
        duration: Duration(milliseconds: 700));
  }

  navigateToAttendance() {
    _navigationService.navigateWithTransition(AttendanceView(),
        transition: "rightToLeftWithFade",
        duration: Duration(milliseconds: 700));
  }

  navigateToAddStudent() {
    _navigationService.navigateWithTransition(AddStudentView(),
        transition: "rightToLeftWithFade",
        duration: Duration(milliseconds: 700));
  }

  navigateToAboutCollege() {
    _navigationService.navigateWithTransition(AboutCollegeView(),
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
}
