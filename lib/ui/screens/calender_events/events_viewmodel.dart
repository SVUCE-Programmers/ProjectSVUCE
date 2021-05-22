import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/repositories/events_repository/events_repository.dart';

class CalendarEventsViewModel extends BaseViewModel {
  final EventsRepository _eventsRepository = locator<EventsRepository>();
  final NavigationService _navigationService = locator<NavigationService>();

  List<Event> _eventList =[];
  Map<DateTime, List<dynamic>> get eventsList => groupEvents(_eventList);

  Map<DateTime, List<dynamic>> groupEvents(List<Event> events) {
    Map<DateTime, List<dynamic>> data = {};
    events.forEach((e) {
      DateTime h = DateTime.parse(e.timeStamp);
      DateTime date = DateTime(h.year, h.month, h.day, 12);
      if (data[date] == null) data[date] = [];
      data[date].add(e);
    });
    return data;
  }

  List _selectedevents = [];

  List get selectedEvents => _selectedevents;

  getEvents() {
    setBusy(true);
    _eventsRepository.getEvents().listen((feedData) {
      List<Event> eventData = feedData;
      if (eventData != null) {
        _eventList = eventData;
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
}
