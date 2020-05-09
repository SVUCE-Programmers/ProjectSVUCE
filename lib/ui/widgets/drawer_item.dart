import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onTap;

  const DrawerItem({Key key, this.title, this.iconData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: InkWell(
        splashColor: textSecondaryColor,
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            iconData,
            color: textSecondaryColor,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: textSecondaryColor, fontFamily: "Quicksand"),
          ),
        ),
      ),
    );
  }
}
