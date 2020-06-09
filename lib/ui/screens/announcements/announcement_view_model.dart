import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/announcement/announcement.dart';

import 'package:svuce_app/core/repositories/announcements_repository/announcements_repository_impl.dart';

class AnnouncementViewModel extends BaseViewModel {
  final AnnouncementsRepositoryImpl _firestoreService = locator<AnnouncementsRepositoryImpl>();

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
