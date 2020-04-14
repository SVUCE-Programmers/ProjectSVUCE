import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

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

final navItems = [
  BottomNavigationBarItem(
      activeIcon: Icon(MaterialCommunityIcons.home_variant),
      icon: Icon(MaterialCommunityIcons.home_variant_outline),
      title: Text("Home")),
  BottomNavigationBarItem(
      activeIcon: Icon(FontAwesome5Solid.newspaper),
      icon: Icon(FontAwesome5.newspaper),
      title: Text("Feed")),
  BottomNavigationBarItem(
      activeIcon: Icon(MaterialCommunityIcons.calendar),
      icon: Icon(MaterialCommunityIcons.calendar_outline),
      title: Text("Events")),
  BottomNavigationBarItem(
      activeIcon: Icon(FontAwesome5Solid.user),
      icon: Icon(FontAwesome5.user),
      title: Text("Profile")),
];
