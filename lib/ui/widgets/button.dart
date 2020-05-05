import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';

class Button extends StatelessWidget {
  final bool isBusy;
  final bool isBack;
  final Function onPressed;

  const Button({Key key, this.isBusy, this.onPressed, this.isBack = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
        child: isBusy
            ? CircularProgressIndicator()
            : Icon(isBack ? backwardIcon : forwardIcon),
        onPressed: isBusy ? null : onPressed ?? null);
  }
}
