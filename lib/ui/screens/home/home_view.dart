import 'package:flutter/material.dart';
import 'package:svuce_app/ui/screens/action_center/action_center_view.dart';
import 'package:svuce_app/ui/screens/calender_events/events_view.dart';
import 'package:svuce_app/ui/screens/drawer/drawer_view.dart';
import 'package:svuce_app/ui/screens/feed/feed_view.dart';
import 'package:svuce_app/ui/widgets/home_wrapper.dart';

import 'home_view_items.dart';
import 'main.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeWrapper(
      homeItems: <Widget>[
        MainHomeView(),
        FeedView(),
        CalenderEventsView(),
        ActionCenter(),
      ],
      drawer: DrawerView(),
      homeViewItems: homeViewItems,
    );
  }
}
