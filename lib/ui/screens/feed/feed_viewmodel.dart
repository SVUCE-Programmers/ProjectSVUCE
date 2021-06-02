import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/feed/feed.dart';
import 'package:svuce_app/core/repositories/feed_repository/feed_repository.dart';
import 'package:svuce_app/ui/screens/admin%20screens/create%20post/create_post_view.dart';

class FeedViewModel extends BaseViewModel {
  final FeedRepository _feedRepository = locator<FeedRepository>();
  final NavigationService _navigationService = locator<NavigationService>();

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

  navigateBack() {
    _navigationService.back();
  }

  navigationToCreatePost() =>
      _navigationService.navigateWithTransition(CreatePost(),
          transition: "rightToLeftWithFade",
          duration: Duration(milliseconds: 900));
}
