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

final List<SpotlightItem> spotLightItems=[
  SpotlightItem(
    icon: Icons.group, 
    name: "Hall of Fame", 
    onTap: (){},
  ),
  SpotlightItem(
    icon: Icons.check_box_outline_blank, 
    name: "Faculty",
    onTap: (){}
  ),
  SpotlightItem(
    icon: Icons.settings_input_antenna, 
    name: "Announcements",
    onTap: (){}
  ),
  SpotlightItem(
    icon: Icons.timeline, 
    name: "Time table",
    onTap: (){}
  ),
  SpotlightItem(
    icon: Icons.assignment_turned_in, 
    name: "Attendance",
    onTap: (){}
  ),
  SpotlightItem(
    icon: Icons.calendar_today, 
    name: "Clubs",
    onTap: (){}
  ),
];
