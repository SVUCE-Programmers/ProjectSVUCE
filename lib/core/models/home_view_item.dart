import 'package:flutter/material.dart';

class HomeViewItem {
  final String title;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final int scaleRatio;

  HomeViewItem(
      {this.title, this.scaleRatio, this.activeIcon, this.inactiveIcon});
}
