import 'package:flutter/material.dart';
import 'package:svuce_app/constants/icons.dart';
import 'package:svuce_app/models/home_view_item.dart';

import 'app_colors.dart';

final BoxDecoration buttonDecoration = BoxDecoration(
  border: Border.all(color: primary, width: 3.0),
  borderRadius: BorderRadius.circular(10.0),
);

final BoxDecoration textFieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0), color: secondaryLight);

final textFieldInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: secondaryLight));

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
