import 'package:flutter/material.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/models/home_view_item.dart';
import 'package:svuce_app/ui/widgets/gridmenu_item.dart';

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

final List<SpotlightItem> firstRowSpotlight = [
  SpotlightItem(icon: clubsIcon, name: "Explore Clubs", onTap: () {}),
  SpotlightItem(icon: facultyIcon, name: "Faculty", onTap: () {}),
  SpotlightItem(icon: attendanceIcon, name: "Attendance", onTap: () {}),
];

final List<SpotlightItem> secondRowSpotlight = [
  SpotlightItem(icon: hallOfFameIcon, name: "Hall of Fame", onTap: () {}),
  SpotlightItem(icon: timeTableIcon, name: "Time table", onTap: () {}),
  SpotlightItem(icon: campusIcon, name: "Campus", onTap: () {}),
];
