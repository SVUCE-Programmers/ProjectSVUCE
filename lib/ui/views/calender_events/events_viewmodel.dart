import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/event.dart';
import 'package:svuce_app/services/firestore_service.dart';

class CalendarEventsViewModel extends BaseViewModel{

  final FirestoreService _firestoreService = locator<FirestoreService>();

  List<Event> _eventList=List<Event>();
  Map<DateTime,List<dynamic>> get eventsList=>groupEvents(_eventList);

  Map<DateTime,List<dynamic>> groupEvents(List<Event> events){
    Map<DateTime,List<dynamic>> data={};
    events.forEach((e){
      DateTime h=DateTime.parse(e.timeStamp); 
      DateTime date=DateTime(h.year,h.month,h.day,12);
      if(data[date]==null) data[date]=[];
      data[date].add(e);
    });
    return data;
  }

  getEvents() {
    setBusy(true);
    _firestoreService.listenToEventsData().listen((feedData) {
      List<Event> eventoo = feedData;
      if (eventoo != null) {
        _eventList = eventoo;
        notifyListeners();
      }
      setBusy(false);
    });
  }
  
}