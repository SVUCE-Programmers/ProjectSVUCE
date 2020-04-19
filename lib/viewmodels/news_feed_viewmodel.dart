import 'package:svuce_app/models/feed.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

import '../locator.dart';

class NewsFeedViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();

  List<Feed> _feedItems;
  List<Feed> get feedItems => _feedItems;

  getFeed() {
    setBusy(true);

    _firestoreService.listenToFeedRealTime().listen((feedData) {
      List<Feed> updatedPosts = feedData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _feedItems = updatedPosts;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  void requestMoreData() => _firestoreService.requestMoreData();
}
