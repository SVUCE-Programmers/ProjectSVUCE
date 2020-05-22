import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/hive_db/models/time_table.dart';

class TimeTableItem extends StatelessWidget {
  final TimeTable timeTable;

  const TimeTableItem({Key key, this.timeTable}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          color: surfaceColor, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
          title: Text.rich(TextSpan(
              style: TextStyle().copyWith(color: textSecondaryColor),
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
            color: primaryColor,
          )),
    );
  }
}
