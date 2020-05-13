import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/models/home_view_item.dart';

final List<HomeViewItem> homeViewItems = [
  HomeViewItem(
      title: "Home",
      activeIcon: homeIconFilled,
      inactiveIcon: homeIcon,
      scaleRatio: 25),
  HomeViewItem(
      title: "Feed",
      activeIcon: feedIconFilled,
      inactiveIcon: feedIcon,
      scaleRatio: 25),
  HomeViewItem(
      title: "Events",
      activeIcon: eventsIconFilled,
      inactiveIcon: eventsIcon,
      scaleRatio: 25),
  HomeViewItem(
      title: "Action Center",
      activeIcon: actionCenterIconFilled,
      inactiveIcon: actionCenterIcon,
      scaleRatio: 35),
];
