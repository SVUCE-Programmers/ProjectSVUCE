import 'package:flutter/material.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';

import 'widgets/time_table_item.dart';
import 'consumers/week_day_selector.dart';

import 'time_table_viewmodel.dart';

class TimeTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<TimeTableViewModel>(
      onModelReady: (model) => model.init(),
      viewModel: TimeTableViewModel(),
      builder: (context, uiHelpers, model) {
        var timeTableItems = model.getTimeTable();
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.navigateToEditTimeTable(),
            child: Icon(Icons.edit),
            backgroundColor: uiHelpers.primaryColor,
          ),
          appBar: AppBar(
            leading: Hero(
              tag: "backIcon",
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                    icon: Icon(
                      backIcon,
                      color: uiHelpers.textPrimaryColor,
                    ),
                    onPressed: () => model.navigateBack()),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Timetable",
              style: uiHelpers.headline
                  .copyWith(color: uiHelpers.textPrimaryColor),
            ),
          ),
          body: model.timeTable != null
              ? ListView(
                  padding: EdgeInsets.all(20.0),
                  children: <Widget>[
                    WeekDaySelector(),
                    uiHelpers.verticalSpaceLow,
                    // if (timeTableItems is List && timeTableItems.length > 0)
                    //   ...timeTableItems
                    //       //TODO: Implement [Remaind Me] Feature
                    //       .map((eachTimeTable) => TimeTableItem(
                    //             timeTable: eachTimeTable,
                    //           ))
                    //       .toList()
                    // else if (timeTableItems is List)
                    //   Text(
                    //     "No Classes Today}",
                    //     textAlign: TextAlign.center,
                    //   )
                    // else
                    //   Text("Relax")
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
