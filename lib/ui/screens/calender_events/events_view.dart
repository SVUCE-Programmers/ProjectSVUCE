import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:table_calendar/table_calendar.dart';

import 'events_viewmodel.dart';
import 'widgets/events_list_item.dart';

class CalenderEventsView extends StatelessWidget {
  final CalendarController _controller = CalendarController();

  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CalendarEventsViewModel>(
      onModelReady: (model) => model.getEvents(),
      viewModel: CalendarEventsViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        body: model.eventsList != null
            ? ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Container(
                    child: TableCalendar(
                      startingDayOfWeek: StartingDayOfWeek.sunday,
                      onDaySelected: model.onDaySelected,
                      calendarController: _controller,
                      events: model.eventsList,
                      calendarStyle: buildCalendarStyle(),
                      headerStyle: buildHeaderStyle(uiHelpers),
                      builders: buildCalendarBuilders(uiHelpers),
                    ),
                  ),
                  ...model.selectedEvents.length != 0
                      ? model.selectedEvents
                          .map((event) => EventListItem(
                                event: event as Event,
                                onTap: () => model.gotoDetailsPage(event),
                              ))
                          .toList()
                      : [SizedBox()]
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  CalendarStyle buildCalendarStyle() {
    return CalendarStyle(
      contentPadding: EdgeInsets.all(10),
      outsideDaysVisible: true,
      todayColor: textSecondaryColor,
      selectedColor: primaryColor,
    );
  }

  CalendarBuilders buildCalendarBuilders(UIHelpers uiHelpers) {
    return CalendarBuilders(
      dowWeekdayBuilder: (context, string) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              string,
              style: uiHelpers.body.copyWith(color: textPrimaryColor),
            )
          ],
        );
      },
    );
  }

  HeaderStyle buildHeaderStyle(UIHelpers uiHelpers) {
    return HeaderStyle(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      formatButtonVisible: false,
      centerHeaderTitle: true,
      leftChevronIcon: Icon(backwardIcon, color: Colors.white),
      rightChevronIcon: Icon(forwardIcon, color: Colors.white),
      headerMargin: EdgeInsets.symmetric(vertical: 10),
      titleTextStyle: uiHelpers.title.copyWith(color: textPrimaryColor),
    );
  }
}
