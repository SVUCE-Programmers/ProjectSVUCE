import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class CirclePercentageWidget extends StatefulWidget {
  final String title;
  final double percent;

  const CirclePercentageWidget({Key key, this.title = "", this.percent = 0.0})
      : super(key: key);

  @override
  _CirclePercentageWidgetState createState() => _CirclePercentageWidgetState();
}

class _CirclePercentageWidgetState extends State<CirclePercentageWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.animateTo(widget.percent);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(CirclePercentageWidget oldWidget) {
    if (oldWidget.percent != widget.percent) {
      _animationController.animateTo(widget.percent);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.title,
          style:
              TextStyle(fontWeight: FontWeight.w200, fontFamily: "Quicksand"),
        ),
        Container(
          width: (MediaQuery.of(context).size.height / 480) * 42,
          height: 42 * (MediaQuery.of(context).size.height / 480),
          margin: EdgeInsets.all(12),
          child: CustomPaint(
            isComplex: false,
            painter:
                PercentagePainter(percent: widget.percent, context: context),
            child: Center(
              child: Text("${(_animationController.value * 100).toInt()}"),
            ),
          ),
        ),
      ],
    );
  }
}

class PercentagePainter extends CustomPainter {
  final double percent;
  final BuildContext context;

  PercentagePainter({this.percent, this.context});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.orange;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5 * (MediaQuery.of(context).size.height / 480);
    paint.strokeCap = StrokeCap.square;
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), 0, math.pi * 2,
        false, paint);
    paint.shader = ui.Gradient.linear(
        Offset.zero, Offset(0, size.height), [Colors.teal, Colors.tealAccent]);
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), -math.pi / 2,
        -2 * math.pi * percent, false, paint);
  }

  @override
  bool shouldRepaint(PercentagePainter oldDelegate) {
    return percent != oldDelegate.percent;
  }

  @override
  bool shouldRebuildSemantics(PercentagePainter oldDelegate) => false;
}
