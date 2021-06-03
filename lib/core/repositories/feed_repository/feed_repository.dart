import 'package:flutter/material.dart';
import 'package:svuce_app/core/models/feed/feed.dart';

abstract class FeedRepository {
  Stream getFeed();
  void requestMoreData();
  Future<bool> createPost({@required Feed feed});
  Future<bool> deletePost({@required Feed feed});
  Future<bool> updatePost({@required Feed feed});
  void initFeedMode();
}
