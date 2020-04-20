import 'package:flutter/material.dart';
import 'package:svuce_app/models/feed.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';
import 'package:svuce_app/ui/shared/shared_styles.dart';
import 'package:svuce_app/ui/shared/ui_helpers.dart';

class FeedItem extends StatelessWidget {
  final Feed feed;

  const FeedItem({Key key, this.feed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: textFieldDecoration,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 300,
      child: GestureDetector(
        onTap: () {},
        child: GridTile(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: feed?.category ?? "Placement",
                style: subtitle.apply(color: primary)),
            newLine,
            TextSpan(
                text: feed?.title ??
                    "Introducing the improvements in the upcoming sessions",
                style: subhead.apply(color: textPrimary)),
            newLine,
            newLine,
            TextSpan(
                text: feed?.description ??
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
                style: bodyText.apply(color: textPrimary.withOpacity(.7))),
          ])),
          footer: Row(
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                color: primary,
              ),
              horizontalSpaceLow,
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: feed?.fullName ?? "Siddish Reddy", style: subtitle),
                TextSpan(text: " | ", style: subtitle),
                TextSpan(
                    text: feed?.timeStamp ?? "10 mins ago", style: subtitle),
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
