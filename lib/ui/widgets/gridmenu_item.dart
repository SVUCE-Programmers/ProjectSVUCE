import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

class SpotlightItem extends StatelessWidget {
  final IconData icon;
  final String name;
  const SpotlightItem({Key key, @required this.icon, @required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);

    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: uiHelpers.surfaceColor),
          child: Icon(
            icon,
            color: uiHelpers.primaryColor,
          ),
          padding: EdgeInsets.all(20.0),
        ),
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: uiHelpers.textPrimaryColor),
        )
      ],
    );
  }
}
