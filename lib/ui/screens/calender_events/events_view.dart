import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/ui/screens/calender_events/widgets/events_list_item.dart';
import 'package:table_calendar/table_calendar.dart';

import 'events_viewmodel.dart';

class CalenderEventsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<CalendarEventsViewModel>(
      onModelReady: (model) => model.getEvents(),
      viewModel: CalendarEventsViewModel(),
      builder: (context, uiHelpers, model) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              icon: Icon(
                backIcon,
                color: uiHelpers.textPrimaryColor,
              ),
              onPressed: model.navigateBack),
          title: Text(
            "Event Calendar",
            style: uiHelpers.headline,
          ),
        ),
        body: model.eventsList != null
            ? ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Container(
                    child: TableCalendar(
                      eventLoader: (day) {
                        return model.eventsList[day];
                      },
                      calendarStyle: CalendarStyle(
                        rangeHighlightColor: uiHelpers.primaryColor,
                      ),
                      availableCalendarFormats: {CalendarFormat.month: "Month"},
                      calendarBuilders: CalendarBuilders(),
                      calendarFormat: CalendarFormat.month,
                      onDaySelected: (selectedDay, focusedDay) {
                        model.log.v(selectedDay);
                        model.changeDate(selectedDay);
                      },
                      selectedDayPredicate: (day) {
                        return isSameDay(model.dateTime, day);
                      },
                      firstDay: DateTime.utc(DateTime.now().year - 4, 1, 1),
                      lastDay: DateTime.utc(DateTime.now().year + 4, 12, 31),
                      focusedDay: model.dateTime,
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
}
