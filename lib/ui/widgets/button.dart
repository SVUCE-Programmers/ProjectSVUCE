import 'dart:math';

import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';

class Button extends StatelessWidget {
  final bool isBusy;
  final bool isBack;
  final IconData icon;
  final Function onPressed;

  const Button(
      {Key key, this.isBusy, this.onPressed, this.isBack = false, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var random = Random();

    return FloatingActionButton(
        heroTag: random.nextInt(100),
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
        child: isBusy
            ? CircularProgressIndicator()
            : icon == null
                ? Icon(isBack ? backwardIcon : forwardIcon)
                : Icon(icon),
        onPressed: isBusy ? null : onPressed ?? null);
  }
}
