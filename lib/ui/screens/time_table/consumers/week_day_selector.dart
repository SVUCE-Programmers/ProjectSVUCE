import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/time_table/time_table_viewmodel.dart';

class WeekDaySelector extends ViewModelWidget<TimeTableViewModel> {
  @override
  Widget build(BuildContext context, TimeTableViewModel model) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return model.currentIndex != 6
        ? Container(
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
                            ? uiHelpers.surfaceColor
                            : uiHelpers.backgroundColor,
                        borderRadius: BorderRadius.circular(10.0)),
                    padding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: weekDay + "\n",
                            style:
                                TextStyle(color: uiHelpers.textSecondaryColor)),
                        TextSpan(text: model.weekDates[index].day.toString()),
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        : SizedBox();
  }
}
