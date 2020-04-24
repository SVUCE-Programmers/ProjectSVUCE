import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/shared/font_styles.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onTap;

  const DrawerItem({Key key, this.title, this.iconData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: secondaryDark,
      child: InkWell(
        splashColor: secondaryLight,
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            iconData,
            color: secondaryLight,
          ),
          title: Text(
            title,
            style: bodyText.copyWith(
                color: secondaryLight, fontFamily: "Quicksand"),
          ),
        ),
      ),
    );
  }
}
