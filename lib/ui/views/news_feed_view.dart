import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/widgets/feed_item.dart';
import 'package:svuce_app/viewmodels/news_feed_viewmodel.dart';

class NewsFeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NewsFeedViewModel>.withoutConsumer(
        viewModel: NewsFeedViewModel(),
        builder: (context, model, child) => Scaffold(
              body: FeedItem(),
            ));
  }
}
