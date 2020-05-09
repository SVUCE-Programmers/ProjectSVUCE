import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/ui/widgets/navbar_button.dart';
class AnimatedBottomBar extends StatelessWidget {
  final ValueChanged<int> itemTapped;
  final int cI;
  final List<BarItem> items;

  const AnimatedBottomBar({this.items, this.itemTapped, this.cI = 0});

  BarItem get selectedItem => cI >= 0 && cI < items.length ? items[cI] : null;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonWidgets = items.map((data) {
      return NavbarButton(
        data, data == selectedItem, 
        onTap: () {
        var index = items.indexOf(data);
        itemTapped(index);
      });
    }).toList();

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(12, 8, 8, 10),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      height: 80,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: buttonWidgets,
      ),
    );
  }
}

class BarItem {
  final String text;
  final IconData iconData;
  final double width;

  BarItem({this.text, this.iconData, this.width});
}