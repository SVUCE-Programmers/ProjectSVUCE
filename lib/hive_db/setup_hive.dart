import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:svuce_app/hive_db/attendance.dart';
import 'package:svuce_app/hive_db/staff.dart';
import 'package:svuce_app/hive_db/time_table.dart';

void setupHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(StaffAdapter());
  Hive.registerAdapter(TimeTableAdapter());
  Hive.registerAdapter(AttendanceAdapter());
}
