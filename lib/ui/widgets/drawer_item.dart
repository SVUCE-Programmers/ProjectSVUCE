import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onTap;

  const DrawerItem({Key key, this.title, this.iconData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return Material(
      color: uiHelpers.backgroundColor,
      child: InkWell(
        splashColor: uiHelpers.textSecondaryColor,
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            iconData,
            color: uiHelpers.textSecondaryColor,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: uiHelpers.textSecondaryColor, fontFamily: "Quicksand"),
          ),
        ),
      ),
    );
  }
}
