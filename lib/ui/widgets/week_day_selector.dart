import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/ui/views/time_table/time_table_viewmodel.dart';
import 'package:svuce_app/ui/views/time_table/utils.dart';

class WeekDaySelector extends ViewModelWidget<TimeTableViewModel> {
  @override
  Widget build(BuildContext context, TimeTableViewModel model) {
    return Container(
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        children: weekDays.map((weekDay) {
          var index = weekDays.indexOf(weekDay);
          return GestureDetector(
            onTap: () {
              model.changeCurrentDay(index);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: model.currentIndex == index
                      ? surfaceColor
                      : backgroundColor,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: weekDay + "\n",
                      style: TextStyle(color: textSecondaryColor)),
                  TextSpan(text: model.weekDates[index].toString()),
                ]),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
