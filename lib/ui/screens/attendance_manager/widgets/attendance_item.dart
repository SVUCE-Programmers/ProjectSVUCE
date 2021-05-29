import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

import './../attendance_manager_view_model.dart';
class AttendanceItem extends ViewModelWidget<AttendanceManagerViewModel> {
  final int index;

  AttendanceItem(this.index);

  @override
  Widget build(BuildContext context, AttendanceManagerViewModel model) {
    var attendance = model.attendanceList[index];
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return Container(
      decoration: BoxDecoration(
        border: Border(
            left: BorderSide(
                color: attendance.total == 0
                    ? Colors.greenAccent
                    : (attendance.present / attendance.total) >= 0.75
                        ? Colors.green
                        : Colors.red,
                width: 5.0,
                style: BorderStyle.solid)),
        color: uiHelpers.surfaceColor,
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        isThreeLine: true,
        title: Text.rich(TextSpan(children: [
          TextSpan(
            text: attendance.subject,
            style: TextStyle(color: uiHelpers.textPrimaryColor),
          ),
          TextSpan(text: "\n"),
          TextSpan(
            text: model.getStatus(attendance.present, attendance.total),
            style: TextStyle(color: uiHelpers.textPrimaryColor),
          ),
        ])),
        subtitle: Wrap(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => model.addPresent(index),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => model.addAbsent(index),
            )
          ],
        ),
        trailing: Text.rich(TextSpan(children: [
          TextSpan(text: attendance.present.toString()),
          TextSpan(text: "/"),
          TextSpan(text: attendance.total.toString()),
        ])),
      ),
    );
  }
}
