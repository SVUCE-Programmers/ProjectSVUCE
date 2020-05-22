import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/views/action_center/action_center_viewmodel.dart';
import 'package:svuce_app/ui/views/attendance_manager/attendance_view.dart';
import 'package:svuce_app/ui/views/time_table/time_table_view.dart';

class ActionCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<ActionCenterViewModel>(
      viewModel: ActionCenterViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, uiHelpers, model) => Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Today Classes",
                  style: TextStyle(
                      color: textPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeTableView()));
                  },
                  child: Text(
                    "See all",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w200,
                        fontSize: 14),
                  ),
                )
              ],
            ),
            uiHelpers.verticalSpaceLow,
            Container(
              height: 100,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: model.classes.length,
                  itemBuilder: (context, index) {
                    return model.classes[index].day == model.day
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: surfaceColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  model.classes[index].startTime +
                                      " - " +
                                      model.classes[index].endTime,
                                  style: TextStyle(
                                      color: textSecondaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  model.classes[index].className,
                                  style: TextStyle(
                                      color: textPrimaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                )
                              ],
                            ),
                          )
                        : SizedBox();
                  }),
            ),
            uiHelpers.verticalSpaceLow,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Attendance Showcase",
                  style: TextStyle(
                      color: textPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AttendanceView()));
                  },
                  child: Text(
                    "more",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w200,
                        fontSize: 14),
                  ),
                )
              ],
            ),
          ],
        )),
      )),
    );
  }
}
