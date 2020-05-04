import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';

class Button extends StatelessWidget {
  final bool isBusy;
  final Function onPressed;

  const Button({Key key, this.isBusy, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        backgroundColor: primaryColor,
        foregroundColor: backgroundColor,
        child: isBusy ? CircularProgressIndicator() : Icon(Icons.arrow_forward),
        onPressed: isBusy ? null : onPressed ?? null);
  }
}
