import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/viewmodels/news_feed_viewmodel.dart';

class NewsFeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<NewsFeedViewModel>.withConsumer(
        viewModel: NewsFeedViewModel(),
        builder: (context, model, child) => Scaffold());
  }
}
