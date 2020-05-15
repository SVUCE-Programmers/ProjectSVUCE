import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

class SpotlightItem extends StatelessWidget {
  final IconData icon;
  final String name;
  final Function onTap;
  const SpotlightItem(
      {Key key, @required this.icon, @required this.name, @required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: surfaceColor),
            child: Icon(
              icon,
              color: primaryColor,
            ),
            padding: EdgeInsets.all(20.0),
          ),
        ),
        Text(
          name,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: textPrimaryColor),
        )
      ],
    );
  }
}
