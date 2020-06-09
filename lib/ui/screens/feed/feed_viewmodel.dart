import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/feed/feed.dart';
import 'package:svuce_app/core/repositories/feed_service.dart';

class FeedViewModel extends BaseViewModel {
  final FeedService _feedService = locator<FeedService>();

  List<Feed> _feedItems;
  List<Feed> get feedItems => _feedItems;

  getFeed() {
    setBusy(true);

    _feedService.listenToFeedRealTime().listen((feedData) {
      List<Feed> updatedPosts = feedData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _feedItems = updatedPosts;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  void requestMoreData() => _feedService.requestMoreData();
}
