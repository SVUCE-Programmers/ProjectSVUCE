import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';

class AnimatedText extends Text {
  final double xDistance, yDistance, delay;
  final TextStyle style;
  final TextAlign textAlign;
  final Duration xDuration, yDuration, fadeDuration;

  AnimatedText(
      {@required String data,
      this.delay = 0.5,
      this.xDuration = const Duration(milliseconds: 454),
      this.yDuration = const Duration(milliseconds: 454),
      this.fadeDuration = const Duration(milliseconds: 454),
      this.style,
      this.textAlign,
      this.xDistance,
      this.yDistance})
      : super(data);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return FadeAnimation(
      xDuration: xDuration,
      yDuration: yDuration,
      fadeDuration: fadeDuration,
      xDistance: xDistance ?? 0,
      yDistance: yDistance ?? 30,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Text(
          data,
          style: style ?? uiHelpers.body,
          textAlign: textAlign ?? TextAlign.start,
        ),
      ),
      delay: delay,
    );
  }
}
