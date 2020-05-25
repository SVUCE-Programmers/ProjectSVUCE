import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/ui/views/attendance_manager/attendance_view_model.dart';

class AttendanceItem extends ViewModelWidget<AttendanceViewModel> {
  final int index;

  AttendanceItem(this.index);

  @override
  Widget build(BuildContext context, AttendanceViewModel model) {
    var attendance = model.attendanceList[index];

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
        color: surfaceColor,
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        isThreeLine: true,
        title: Text.rich(TextSpan(children: [
          TextSpan(
            text: attendance.subject,
            style: TextStyle(color: textPrimaryColor),
          ),
          TextSpan(text: "\n"),
          TextSpan(
            text: model.getStatus(attendance.present, attendance.total),
            style: TextStyle(color: textPrimaryColor),
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
