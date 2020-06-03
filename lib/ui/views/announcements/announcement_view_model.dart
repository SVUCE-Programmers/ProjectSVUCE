import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/models/announcement/announcement.dart';

import 'package:svuce_app/services/firestore/announcement_service.dart';

class AnnouncementViewModel extends BaseViewModel {
  final AnnouncementService _firestoreService = locator<AnnouncementService>();

  List<Announcement> _items;
  List<Announcement> get items => _items;

  getData() {
    setBusy(true);

    _firestoreService.getAnnouncements().listen((data) {
      List<Announcement> event = data;

      if (event != null) {
        _items = event;
        notifyListeners();
      }

      setBusy(false);
    });
  }
}
