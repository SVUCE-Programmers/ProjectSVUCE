import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/core/models/home_view_item.dart';
import 'package:svuce_app/ui/widgets/navbar_button.dart';

class AnimatedBottomBar extends StatelessWidget {
  final ValueChanged<int> itemTapped;
  final int currentIndex;
  final List<HomeViewItem> items;

  const AnimatedBottomBar({this.items, this.itemTapped, this.currentIndex = 0});

  HomeViewItem get selectedItem =>
      currentIndex >= 0 && currentIndex < items.length
          ? items[currentIndex]
          : null;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonWidgets = items.map((homeViewItem) {
      return NavbarButton(homeViewItem, homeViewItem == selectedItem,
          onTap: () {
        var index = items.indexOf(homeViewItem);
        itemTapped(index);
      });
    }).toList();

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(12, 8, 8, 10),
      decoration: BoxDecoration(
          color: surfaceColor,
          border: Border(
              top: BorderSide(
            color: textSecondaryColor,
          ))),
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttonWidgets,
      ),
    );
  }
}
