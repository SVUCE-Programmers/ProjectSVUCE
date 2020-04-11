import 'package:flutter/material.dart';
import 'package:svuce_app/ui/shared/app_colors.dart';
import 'package:svuce_app/ui/widgets/custom_clipper.dart';

class CurveWrapper extends StatelessWidget {
  final Widget child;

  const CurveWrapper({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: <Widget>[
      ClipPath(
        clipper: CurveClipper(),
        child: Container(
          decoration: BoxDecoration(
            color: primary,
          ),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
        ),
      ),
      child
    ]);
  }
}
