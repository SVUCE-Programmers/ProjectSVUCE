import 'package:flutter/material.dart';

import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';

class TimeTableItem extends StatelessWidget {
  final TimeTable timeTable;
  final bool isActionCenter;

  const TimeTableItem({Key key, this.timeTable, this.isActionCenter = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Container(
      alignment: Alignment.center,
      padding: isActionCenter ? EdgeInsets.all(20.0) : EdgeInsets.all(5),
      margin: isActionCenter
          ? EdgeInsets.all(10.0)
          : EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: uiHelpers.surfaceColor,
          borderRadius: BorderRadius.circular(10)),
      child: isActionCenter
          ? Text.rich(TextSpan(
              style: TextStyle().copyWith(color: uiHelpers.textSecondaryColor),
              children: [
                  TextSpan(text: timeTable?.startTime),
                  TextSpan(text: " - "),
                  TextSpan(text: timeTable?.endTime),
                  TextSpan(text: "\n"),
                  TextSpan(
                    text: timeTable.className,
                    style: Theme.of(context).textTheme.headline6,
                  )
                ]))
          : ListTile(
              title: Text.rich(TextSpan(
                  style:
                      TextStyle().copyWith(color: uiHelpers.textSecondaryColor),
                  children: [
                    TextSpan(text: timeTable?.startTime),
                    TextSpan(text: " - "),
                    TextSpan(text: timeTable?.endTime),
                  ])),
              subtitle: Text(
                timeTable.className,
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: Icon(
                notificationIcon,
                color: uiHelpers.primaryColor,
              )),
    );
  }
}
