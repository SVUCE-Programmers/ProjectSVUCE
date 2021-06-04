import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';

class AnimatedText extends Text {
  final double xDistance, yDistance, delay;
  final TextStyle style;
  final TextAlign textAlign;
  AnimatedText(
      {@required String data,
      this.delay = 0.5,
      this.style,
      this.textAlign,
      this.xDistance,
      this.yDistance})
      : super(data);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return FadeAnimation(
      xDistance: xDistance ?? 0,
      yDistance: yDistance ?? 30,
      child: Text(
        data,
        style: style ?? uiHelpers.body,
        textAlign: textAlign ?? TextAlign.start,
      ),
      delay: delay,
    );
  }
}
