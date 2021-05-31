import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/services/api/api_service.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';

@lazySingleton
class TimeTableService {
  final log = getLogger("Time Table Service");
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();
  final AuthService authenticationService = locator<AuthService>();
  static FirebaseFirestore _firebaseFirestore = locator<FirebaseFirestore>();
  static CollectionReference _universityRef =
      _firebaseFirestore.collection("university");

  final StreamController<TimeTable> _timeTableStream =
      StreamController<TimeTable>.broadcast();

  List<TimeTable> streamData = [];

  Stream getTimeTable(String rollNo) {
    var data = _universityRef.doc(rollNo).snapshots();
    data.listen((event) {
      var data = Map<String, dynamic>.from(event.data());
      log.v(data);

      TimeTable timeTable = TimeTable.fromMap(data);
      _timeTableStream.add(timeTable);
    });
    return _timeTableStream.stream;
  }

  List<TimeTable> getCurrentDayClasses() {}

  List<TimeTable> getClassesOfDay(String currentWeekDay) {}
}
