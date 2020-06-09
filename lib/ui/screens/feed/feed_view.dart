import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/ui/widgets/creation_aware_list_item.dart';

import 'widgets/feed_item.dart';

import 'feed_viewmodel.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<FeedViewModel>(
      viewModel: FeedViewModel(),
      onModelReady: (model) => model.getFeed(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          body: model.feedItems != null
              ? ListView.builder(
                  itemCount: model.feedItems.length,
                  padding: EdgeInsets.all(20),
                  itemBuilder: (context, index) => CreationAwareListItem(
                    itemCreated: () {
                      if (index % 10 == 0) model.requestMoreData();
                    },
                    child: model.isBusy
                        ? CircularProgressIndicator()
                        : GestureDetector(
                            child: FeedItem(
                              uiHelpers: uiHelpers,
                              feed: model.feedItems[index],
                            ),
                          ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                  ),
                ),
        );
      },
    );
  }
}
