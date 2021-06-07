import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
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
        floatingActionButton: model.hasAdminAccess
            ? FloatingActionButton(
                backgroundColor: uiHelpers.primaryColor,
                child: Icon(Icons.add),
                onPressed: () => model.navigateToCreateEvent(),
              )
            : SizedBox(),
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
                        return model.eventsList[DateTimeUtils()
                            .getWholeDate(day.millisecondsSinceEpoch)
                            .toString()];
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
                  uiHelpers.verticalSpaceLow,
                  ListView.builder(
                    itemBuilder: (context, index) => EventListItem(
                      onTap: (Event event) => model.gotoDetailsPage(event),
                      event: model.eventsList[DateTimeUtils()
                          .getWholeDate(model.dateTime.millisecondsSinceEpoch)
                          .toString()][index],
                    ),
                    itemCount: model.eventsList[DateTimeUtils()
                                .getWholeDate(
                                    model.dateTime.millisecondsSinceEpoch)
                                .toString()] !=
                            null
                        ? model
                            .eventsList[DateTimeUtils()
                                .getWholeDate(
                                    model.dateTime.millisecondsSinceEpoch)
                                .toString()]
                            .length
                        : 0,
                    shrinkWrap: true,
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                  )
                ],
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
