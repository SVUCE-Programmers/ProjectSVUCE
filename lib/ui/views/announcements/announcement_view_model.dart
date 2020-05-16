import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/annnouncement.dart';
import 'package:svuce_app/services/firestore_service.dart';

class AnnouncementViewModel extends BaseViewModel{
  final FirestoreService _firestoreService = locator<FirestoreService>();

  List<Announcement> _items;
  List<Announcement> get items => _items;

  getData() {
    setBusy(true);
    print("Hmmmm");
    _firestoreService.listenToAnnouncement().listen((data) {
      List<Announcement> event = data;
      print("Announcement events are:"+event.toString());
      if (event != null) {
        _items = event;
        notifyListeners();
      }
      print("Ohhhh");
      setBusy(false);
    });
  }
}