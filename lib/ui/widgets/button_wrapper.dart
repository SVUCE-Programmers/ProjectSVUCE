import 'package:flutter/material.dart';

class WidgetWrapper extends StatelessWidget {
  final BoxDecoration decoration;
  final Widget child;
  const WidgetWrapper({Key key, this.decoration, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: decoration,
      child: child,
    );
  }
}
