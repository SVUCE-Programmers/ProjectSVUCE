import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/AppSetup.router.dart';

import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/repositories/events_repository/events_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/ui/screens/admin%20screens/create%20event/create_event_view.dart';

class CalendarEventsViewModel extends BaseViewModel {
  final log = getLogger("CalendarEventsViewModel");
  final EventsRepository _eventsRepository = locator<EventsRepository>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  bool get hasAdminAccess => _authService.hasAdminAccess;
  DateTime dateTime = DateTime.now();

  List<Event> _eventList = [];
  Map<String, List<Event>> eventsList = {};
  ValueNotifier<List<Event>> get valueSelectedEvents =>
      ValueNotifier(eventsList[dateTime]);

  void groupEvents(List<Event> events) {
    Map<String, List<Event>> data = {};
    events.forEach((e) {
      DateTime h = DateTime.fromMillisecondsSinceEpoch(e.timeStamp);
      DateTime date = DateTime(h.year, h.month, h.day);
      if (data[DateTimeUtils()
              .getWholeDate(date.millisecondsSinceEpoch)
              .toString()] ==
          null) {
        data[DateTimeUtils()
            .getWholeDate(date.millisecondsSinceEpoch)
            .toString()] = [];
      }
      data[DateTimeUtils().getWholeDate(date.millisecondsSinceEpoch).toString()]
          .add(e);
    });
    eventsList = data;
    notifyListeners();
  }

  List _selectedevents = [];

  List get selectedEvents => _selectedevents;
  changeDate(DateTime newDateTime) {
    dateTime = newDateTime;
    notifyListeners();
  }

  getEvents() {
    setBusy(true);
    _eventsRepository.getEvents().listen((feedData) {
      List<Event> eventData = feedData;
      if (eventData != null) {
        _eventList = eventData;
        groupEvents(_eventList);
        notifyListeners();
      }
      setBusy(false);
    });
  }

  onDaySelected(DateTime dateTime, List events) {
    _selectedevents = events;
    notifyListeners();
  }

  gotoDetailsPage(Event event) {
    _navigationService.navigateTo(Routes.eventDetailsView,
        arguments: EventDetailsViewArguments(
          event: event,
        ));
  }

  navigateBack() {
    _navigationService.back();
  }

  navigateToCreateEvent() =>
      _navigationService.navigateWithTransition(CreateEventView(),
          transition: "rightToLeftWithFade",
          duration: Duration(milliseconds: 700));
}
