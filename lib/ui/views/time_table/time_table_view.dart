import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
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
              ...getCurrentDayTimeTable(weekDays[model.currentIndex],model)
                  .map((eachTimeTable) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(eachTimeTable.startTime+" - "+eachTimeTable.endTime,
                            style: TextStyle(color: primaryColor,fontSize: 10),),
                            uiHelpers.verticalSpaceLow,
                            Text(eachTimeTable.className,
                            style: TextStyle(color: textPrimaryColor,fontSize: 20,fontWeight: FontWeight.bold
                            ,fontFamily: "Quicksand"),)
                          ],
                        ),
                        Icon(Icons.notifications_active)
                      ],
                    ),
                  ),
                );
              }).toList()
            ],
          ),
        );
      },
    );
  }

  List<dynamic> getCurrentDayTimeTable(String day,TimeTableViewModel model) {
    var res=model.classes.where((element) => element.day==day);
    print("Res2 is:"+res.toString());
    return res.toList();
  }
}
