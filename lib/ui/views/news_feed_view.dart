import 'package:provider_architecture/provider_architecture.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/ui/widgets/creation_aware_list_item.dart';
import 'package:svuce_app/ui/widgets/feed_item.dart';
import 'package:svuce_app/viewmodels/home_viewmodel.dart';
import 'package:svuce_app/viewmodels/news_feed_viewmodel.dart';

import '../../locator.dart';

class NewsFeedView extends ProviderWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel homeViewModel) {
    return ViewModelProvider<NewsFeedViewModel>.withConsumer(
        viewModel: locator<NewsFeedViewModel>(),
        reuseExisting: true,
        onModelReady: (model) => model.getFeed(),
        builder: (context, model, child) => Scaffold(
              body: model.feedItems != null
                  ? ListView.builder(
                      itemCount: model.feedItems.length,
                      padding: EdgeInsets.all(20),
                      itemBuilder: (context, index) => CreationAwareListItem(
                        itemCreated: () {
                          if (index % 10 == 0) model.requestMoreData();
                        },
                        child: model.busy
                            ? CircularProgressIndicator()
                            : GestureDetector(
                                child: FeedItem(
                                  feed: model.feedItems[index],
                                ),
                              ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(
                            Theme.of(context).primaryColor),
                      ),
                    ),
            ));
  }
}
