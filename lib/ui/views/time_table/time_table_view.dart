import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';
// import 'package:svuce_app/hive_db/models/time_table.dart';
import 'package:svuce_app/ui/widgets/time_table_item.dart';
import 'package:svuce_app/ui/widgets/week_day_selector.dart';

import 'time_table_viewmodel.dart';

class TimeTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<TimeTableViewModel>(
      onModelReady: (model) => model.init(),
      viewModel: TimeTableViewModel(),
      builder: (context, uiHelpers, model) {
        List<TimeTable> timeTableItems =
            model.timeTable != null ? model.getCurrentDayTimeTable() : [];
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Timetable",
              style: uiHelpers.headline.copyWith(color: textPrimaryColor),
            ),
          ),
          body: model.timeTable != null
              ? ListView(
                  padding: EdgeInsets.all(20.0),
                  children: <Widget>[
                    WeekDaySelector(),
                    uiHelpers.verticalSpaceLow,
                    if (timeTableItems.length > 0)
                      ...timeTableItems
                          //TODO: Implement [Remaind Me] Feature
                          .map((eachTimeTable) => TimeTableItem(
                                timeTable: eachTimeTable,
                              ))
                          .toList()
                    else
                      Text(
                        "No Classes Today",
                        textAlign: TextAlign.center,
                      )
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
