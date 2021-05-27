import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';

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
        // body: model.eventsList != null
        //     ? ListView(
        //         padding: EdgeInsets.all(20.0),
        //         children: <Widget>[
        //           Container(
        //             child: TableCalendar(
        //               startingDayOfWeek: StartingDayOfWeek.sunday,
        //               onDaySelected: model.onDaySelected,
        //               calendarController: _controller,
        //               events: model.eventsList,
        //               calendarStyle: buildCalendarStyle(),
        //               headerStyle: buildHeaderStyle(UiHelpers),
        //               builders: buildCalendarBuilders(UiHelpers),
        //             ),
        //           ),
        //           ...model.selectedEvents.length != 0
        //               ? model.selectedEvents
        //                   .map((event) => EventListItem(
        //                         event: event as Event,
        //                         onTap: () => model.gotoDetailsPage(event),
        //                       ))
        //                   .toList()
        //               : [SizedBox()]
        //         ],
        //       )
        //     : Center(
        //         child: CircularProgressIndicator(),
        //       ),
      ),
    );
  }
}
