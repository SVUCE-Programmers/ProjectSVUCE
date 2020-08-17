import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'widgets/attendance_item.dart';

import 'attendance_view_model.dart';

class AttendanceView extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<AttendanceViewModel>(
      viewModel: AttendanceViewModel(),
      onModelReady: (model) => model.init(),
      disposeViewModel: false,
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Attendance Manager",
            style: uiHelpers.headline.copyWith(color: textPrimaryColor),
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: model.attendanceList.length,
          itemBuilder: (context, index) {
            return AttendanceItem(index);
          },
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.undo,
                color: primaryColor,
              ),
              title: Text("Undo"),
            ),
            ListTile(
              leading: Icon(
                Icons.unfold_less,
                color: primaryColor,
              ),
              title: Text("Reset"),
            )
          ],
        ),
      ),
    );
  }
}
