import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/models/feed.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';

class FeedItem extends StatelessWidget {
  final Feed feed;
  final UIHelpers uiHelpers;
  const FeedItem({Key key, this.feed, this.uiHelpers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final newLine = TextSpan(text: "\n");

    return Container(
      decoration: BoxDecoration(
          color: surfaceColor, borderRadius: BorderRadius.circular(10.0)),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: feed?.category ?? "Category Here..",
                  style: TextStyle(color: primaryColor)),
              newLine,
              TextSpan(
                  text: feed?.title ?? "Here comes the title of the article",
                  style: uiHelpers.title.apply(color: textPrimaryColor)),
              newLine,
              newLine,
              TextSpan(
                  text: feed?.description ??
                      "Lorem ipsum dolor sit amet, cohorizontalSpaceLow,nsectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                  style: uiHelpers.body.apply(color: textSecondaryColor)),
            ])),
            uiHelpers.verticalSpaceLow,
            Row(
              children: <Widget>[
                Container(
                  width: 30,
                  height: 30,
                  child: feed.profileImg != null
                      ? Image.network(feed?.profileImg)
                      : SizedBox(),
                ),
                Text.rich(TextSpan(
                    style: TextStyle(color: textPrimaryColor),
                    children: [
                      TextSpan(
                        text: feed?.fullName ?? "User Name",
                      ),
                      TextSpan(text: " | ", style: uiHelpers.body),
                      TextSpan(
                        text: feed?.timeStamp ?? "10 mins ago",
                      ),
                    ])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
