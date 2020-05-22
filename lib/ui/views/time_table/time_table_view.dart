import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
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
        List<dynamic> timeTableItems = model.getCurrentDayTimeTable();
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
          ),
        );
      },
    );
  }
}
