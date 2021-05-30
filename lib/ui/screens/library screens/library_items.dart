import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LibraryItem {
  final String name;
  final IconData iconData;
  final Function onTap;

  LibraryItem(
      {@required this.name, @required this.iconData, @required this.onTap});
}

List<LibraryItem> libraryItems = [
  LibraryItem(
      name: "Previous Papers",
      iconData: FlutterIcons.library_mco,
      onTap: () {}),
  LibraryItem(
      name: "Text Books", iconData: FlutterIcons.library_mco, onTap: () {}),
  LibraryItem(
      name: "Source Codes", iconData: FlutterIcons.library_mco, onTap: () {}),
  LibraryItem(name: "Notes", iconData: FlutterIcons.library_mco, onTap: () {})
];
