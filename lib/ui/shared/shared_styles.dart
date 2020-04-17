import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
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
      inactiveIcon: MaterialCommunityIcons.rhombus_outline,
      activeIcon: MaterialCommunityIcons.rhombus,
      title: "Home"),
  HomeViewItem(
      activeIcon: FontAwesome5Solid.newspaper,
      inactiveIcon: FontAwesome5.newspaper,
      title: "Feed"),
  HomeViewItem(
      activeIcon: MaterialCommunityIcons.calendar,
      inactiveIcon: MaterialCommunityIcons.calendar_outline,
      title: "Events"),
  HomeViewItem(
      activeIcon: MaterialIcons.person,
      inactiveIcon: MaterialIcons.person_outline,
      title: "Profile"),
];
