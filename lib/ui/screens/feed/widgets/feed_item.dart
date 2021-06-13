import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:svuce_app/app/locator.dart';

import 'package:svuce_app/core/models/feed/feed.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:svuce_app/core/utils/date_utils.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/feed/feed_viewmodel.dart';

class FeedItem extends StatelessWidget {
  final Feed feed;
  final UiHelpers uiHelpers;
  final Function(Feed feed) updateItem;
  final FeedViewModel model;
  final Function(Feed feed) deleteItem;

  const FeedItem(
      {Key key,
      this.feed,
      @required this.model,
      this.uiHelpers,
      @required this.updateItem,
      @required this.deleteItem})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ShareService _shareService = locator<ShareService>();
    return Container(
      decoration: BoxDecoration(
          color: uiHelpers.surfaceColor,
          borderRadius: BorderRadius.circular(10.0)),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListTile(
            trailing: PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: uiHelpers.textSecondaryColor,
              ),
              color: uiHelpers.backgroundColor,
              onSelected: (value) {
                switch (value) {
                  case "Update":
                    updateItem(feed);
                    break;
                  case "Delete":
                    deleteItem(feed);

                    break;
                  default:
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text("Update", style: uiHelpers.body),
                  value: "Update",
                ),
                PopupMenuItem(
                  child: Text("Delete", style: uiHelpers.body),
                  value: "Delete",
                )
              ],
            ),
            dense: true,
            contentPadding: EdgeInsets.zero,
            subtitle: Text.rich(
              TextSpan(
                  text: feed?.title ?? "Here comes the title of the article",
                  style:
                      uiHelpers.title.apply(color: uiHelpers.textPrimaryColor)),
            ),
            title: Text.rich(
              TextSpan(
                  text: feed?.category ?? "Category Here..",
                  style: TextStyle(color: uiHelpers.primaryColor)),
            ),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: feed?.description ??
                    "Lorem ipsum dolor sit amet, cohorizontalSpaceLow,nsectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                style:
                    uiHelpers.body.apply(color: uiHelpers.textSecondaryColor)),
          ])),
          SizedBox(
            height: 8,
          ),
          feed.imgUrl == null
              ? SizedBox()
              : Container(
                  width: uiHelpers.width,
                  height: 200,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => showPhotoDialog(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: FadeInImage(
                              placeholder: AssetImage("assets/images/logo.png"),
                              width: uiHelpers.width,
                              height: 200,
                              fit: BoxFit.fitWidth,
                              image: NetworkImage(feed.imgUrl)),
                        ),
                      ),
                      Positioned(
                        top: 5,
                        right: 10,
                        child: CircleAvatar(
                          backgroundColor: uiHelpers.primaryColor,
                          child: IconButton(
                            icon: Icon(
                              Icons.download,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () =>
                                model.downloadFile(feed.imgUrl, feed.title),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
          (feed.link != null && feed.link != "")
              ? Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(text: "Link:  "),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                _shareService.launchUrl(urlLink: feed.link),
                          text: feed.link,
                          style: uiHelpers.body.apply(
                              decoration: TextDecoration.underline,
                              color: uiHelpers.primaryColor))
                    ]))
                  ],
                )
              : SizedBox(),
          uiHelpers.verticalSpaceLow,
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 30,
                  height: 30,
                  child: feed.profileImg != null
                      ? FadeInImage(
                          imageErrorBuilder: (_, __, ___) =>
                              Image.asset("assets/images/boy1.png"),
                          placeholder: AssetImage("assets/images/boy1.png"),
                          image: NetworkImage(feed.profileImg))
                      : Image.asset("assets/images/boy1.png"),
                ),
              ),
              uiHelpers.horizontalSpaceLow,
              Text.rich(TextSpan(
                  style: TextStyle(color: uiHelpers.textPrimaryColor),
                  children: [
                    TextSpan(
                      text: feed?.fullName ?? "User Name",
                    ),
                    TextSpan(text: " | ", style: uiHelpers.body),
                    TextSpan(
                      text: DateTimeUtils()
                              .timeAgoSinceDate(DateTime.parse(feed.timeStamp)
                                  .millisecondsSinceEpoch)
                              ?.toString() ??
                          "10 mins ago",
                    ),
                  ])),
            ],
          ),
        ],
      ),
    );
  }

  showPhotoDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: uiHelpers.backgroundColor,
              contentPadding: EdgeInsets.zero,
              content: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FadeInImage(
                    placeholder: AssetImage("assets/images/logo.png"),
                    width: uiHelpers.width,
                    image: NetworkImage(feed.imgUrl)),
              ),
            ));
  }
}
