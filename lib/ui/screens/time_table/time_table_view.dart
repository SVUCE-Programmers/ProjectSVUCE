import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/screens/time_table/widgets/time_table_item.dart';

import 'consumers/week_day_selector.dart';

import 'time_table_viewmodel.dart';

class TimeTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<TimeTableViewModel>(
      onModelReady: (model) => model.init(),
      viewModel: TimeTableViewModel(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          floatingActionButton: model.hasAdminAccess
              ? FloatingActionButton(
                  onPressed: () => model.navigateToEditTimeTable(),
                  child: Icon(Icons.edit),
                  backgroundColor: uiHelpers.primaryColor,
                )
              : SizedBox(),
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
              "Timetable ",
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
                    model.getTimeTable().length == 0
                        ? Column(
                            children: [
                              Lottie.asset("assets/lottie/no_classes.json"),
                              Text(
                                "No classes today",
                                style: uiHelpers.headline,
                              ),
                            ],
                          )
                        : Column(
                            children: List.generate(
                                model.getTimeTable().length,
                                (index) => TimeTableItem(
                                      model: model,
                                      className: model
                                          .getTimeTable()
                                          .values
                                          .elementAt(index),
                                      date: model
                                          .getTimeTable()
                                          .keys
                                          .elementAt(index),
                                    )),
                          )
                  ],
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
