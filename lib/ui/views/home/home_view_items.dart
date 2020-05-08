import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/models/home_view_item.dart';

final List<HomeViewItem> homeViewItems = [
  HomeViewItem(
      title: "Home", activeIcon: homeIconFilled, inactiveIcon: homeIcon),
  HomeViewItem(
      title: "Feed", activeIcon: feedIconFilled, inactiveIcon: feedIcon),
  HomeViewItem(
      title: "Events", activeIcon: eventsIconFilled, inactiveIcon: eventsIcon),
  HomeViewItem(
      title: "Action Center",
      activeIcon: actionCenterIconFilled,
      inactiveIcon: actionCenterIcon),
];
