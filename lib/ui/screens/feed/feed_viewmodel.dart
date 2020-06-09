import 'package:stacked/stacked.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/feed/feed.dart';
import 'package:svuce_app/core/repositories/feed_repository/feed_repository.dart';

class FeedViewModel extends BaseViewModel {
  final FeedRepository _feedRepository = locator<FeedRepository>();

  List<Feed> _feedItems;
  List<Feed> get feedItems => _feedItems;

  getFeed() {
    setBusy(true);

    _feedRepository.getFeed().listen((feedData) {
      List<Feed> updatedPosts = feedData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _feedItems = updatedPosts;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  void requestMoreData() => _feedRepository.requestMoreData();
}
