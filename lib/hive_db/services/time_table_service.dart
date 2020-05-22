import 'package:injectable/injectable.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:svuce_app/services/hive_service.dart';

@lazySingleton
class TimeTableService {
  final HiveService hiveService = locator<HiveService>();
  final APIService apiService = locator<APIService>();
  final AuthenticationService authenticationService =
      locator<AuthenticationService>();

  List<TimeTable> streamData = List<TimeTable>();

  final String url =
      "https://raw.githubusercontent.com/shashiben/luffy/master/timetable.json";

  getTimeTable() async {
    bool exists = await hiveService.isExists(boxName: "TimeTable");

    final String studentYear = authenticationService.getStudentPresentYear();

    if (exists) {
      // Getting data from Hive
      List<TimeTable> temp = await hiveService.getBoxes<TimeTable>("TimeTable");

      List<TimeTable> streamData = List<TimeTable>();

      for (var item in temp) {
        if (item.year == studentYear) {
          streamData.add(item);
        }
      }

      return streamData;
    } else {
      // Getting data from API and storing in hive for later usage

      try {
        var result = await apiService.fetchData(url: url);

        List<TimeTable> streamData = List<TimeTable>();

        (result as List).map((item) {
          TimeTable timeTable = TimeTable(
              className: item["class_name"],
              startTime: item["start_time"],
              endTime: item["end_time"],
              day: item["day"],
              year: item["year"]);

          streamData.add(timeTable);
        }).toList();

        await hiveService.addBoxes<TimeTable>(streamData, "TimeTable");

        return streamData
            .where((element) => element.year == studentYear)
            .toList();
      } catch (e) {
        return e;
      }
    }
  }
}
