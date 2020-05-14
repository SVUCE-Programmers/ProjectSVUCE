import 'package:flutter/material.dart';
import 'package:svuce_app/ui/views/calender_events/events_view.dart';
import 'package:svuce_app/ui/views/drawer/drawer_view.dart';
import 'package:svuce_app/ui/views/feed/feed_view.dart';
import 'package:svuce_app/ui/views/home/home_view_items.dart';
import 'package:svuce_app/ui/widgets/home_wrapper.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeWrapper(
      homeItems: <Widget>[
        Container(
          child: Center(
            child: Text("Home"),
          ),
        ),
        FeedView(),
        CalenderEventsView(),
        Container(
          child: Center(
            child: Text("Action"),
          ),
        ),
      ],
      drawer: DrawerView(),
      homeViewItems: homeViewItems,
    );
  }
}
