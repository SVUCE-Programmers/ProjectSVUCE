import 'package:flutter/material.dart';
import 'package:svuce_app/app/icons.dart';

import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/time_table/time_table_viewmodel.dart';

class TimeTableItem extends StatelessWidget {
  final String date;
  final String className;
  final TimeTableViewModel model;

  const TimeTableItem(
      {Key key,
      @required this.date,
      @required this.className,
      @required this.model})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: uiHelpers.surfaceColor,
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          title: Text.rich(TextSpan(
              style: TextStyle().copyWith(color: uiHelpers.primaryColor),
              children: [
                TextSpan(text: date.split("-")[0]),
                TextSpan(text: " - "),
                TextSpan(text: date.split("-")[1]),
              ])),
          subtitle: Text(
            className,
            style: Theme.of(context).textTheme.headline6,
          ),
          trailing: IconButton(
            onPressed: () => model.addAlarm(context, className, date),
            splashColor: uiHelpers.backgroundColor,
            icon: Icon(
              notificationIcon,
              color: uiHelpers.primaryColor,
            ),
          )),
    );
  }
}
