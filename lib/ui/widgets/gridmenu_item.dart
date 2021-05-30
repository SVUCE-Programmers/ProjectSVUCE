import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class SpotlightItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function onTap;
  const SpotlightItem(
      {Key key, @required this.icon, @required this.name, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return InkWell(
      onTap: onTap ?? () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: Duration(milliseconds: 900),
            width: 80,
            height: 60,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: uiHelpers.surfaceColor),
            child: Icon(
              icon,
              color: uiHelpers.primaryColor,
            ),
            padding: EdgeInsets.all(10.0),
          ),
          Text(
            name,
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: uiHelpers.textPrimaryColor),
          )
        ],
      ),
    );
  }
}
