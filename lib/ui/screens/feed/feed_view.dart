import 'package:flutter/material.dart';
import 'package:svuce_app/app/default_view.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/ui/widgets/creation_aware_list_item.dart';

import 'widgets/feed_item.dart';

import 'feed_viewmodel.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<FeedViewModel>(
      viewModel: FeedViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, uiHelpers, model) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () => model.navigationToCreatePost(),
            child: Icon(Icons.add),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "News Feed",
              style: uiHelpers.headline,
            ),
            leading: IconButton(
                icon: Icon(
                  backIcon,
                  color: uiHelpers.textPrimaryColor,
                ),
                onPressed: model.navigateBack),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
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
                              model: model,
                              updateItem: model.updateItem,
                              deleteItem: model.deletePost,
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
