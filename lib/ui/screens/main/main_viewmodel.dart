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
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/ui/screens/attendance_manager/attendance_view.dart';
import 'package:svuce_app/ui/screens/time_table/time_table_view.dart';

class MainViewModel extends BaseViewModel {
  final log = getLogger("MainViewModel");
  final AuthService _authenticationService = locator<AuthService>();
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
    UserModel user = _authenticationService.currentUser;
    if (user != null) {
      _currentUser = user;
    }
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
}