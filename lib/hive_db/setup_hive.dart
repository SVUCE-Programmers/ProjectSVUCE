import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:svuce_app/app/locator.dart';

import 'models/attendance.dart';
import 'models/placement.dart';
import 'models/staff.dart';
import 'models/time_table.dart';

void setupHive() async {
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  final _hiveInterface = locator<HiveInterface>();

  final path = appDocumentDir.path;
  _hiveInterface.init(path);

  _hiveInterface.registerAdapter(StaffAdapter());
  _hiveInterface.registerAdapter(TimeTableAdapter());
  _hiveInterface.registerAdapter(AttendanceAdapter());
  _hiveInterface.registerAdapter(PlacementAdapter());
}
