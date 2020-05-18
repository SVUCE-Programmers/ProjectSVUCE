import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/models/time_table.dart';
import 'package:svuce_app/ui/views/time_table/sample_mock_data.dart';
import 'package:svuce_app/ui/views/time_table/utils.dart';
import 'package:svuce_app/ui/widgets/week_day_selector.dart';

import 'time_table_viewmodel.dart';

class TimeTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<TimeTableViewModel>(
      onModelReady: (model) => model.init(),
      viewModel: TimeTableViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //     icon: Icon(
            //       backIcon,
            //       color: textPrimaryColor,
            //     ),
            //     onPressed: () {}),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Timetable",
              style: uiHelpers.headline.copyWith(color: textPrimaryColor),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.all(20.0),
            children: <Widget>[
              WeekDaySelector(),
              ...getCurrentDayTimeTable(weekDays[model.currentIndex])
                  .map((eachTimeTable) {
                TimeTable timeTable = TimeTable.fromData(eachTimeTable);
                return Container(
                  child: ListTile(
                    title: Text(timeTable.className),
                  ),
                );
              }).toList()
            ],
          ),
        );
      },
    );
  }

  List<Map<String, String>> getCurrentDayTimeTable(String day) {
    var result = timeTableData.where((timeTable) => timeTable['day'] == day);

    return result.toList();
  }
}
