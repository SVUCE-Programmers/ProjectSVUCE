import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateX, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final double xDistance;
  final double yDistance;
  final Duration xDuration, yDuration, fadeDuration;
  const FadeAnimation(
      {@required this.delay,
      @required this.child,
      this.xDuration = const Duration(milliseconds: 454),
      this.yDuration = const Duration(milliseconds: 454),
      this.fadeDuration = const Duration(milliseconds: 454),
      this.xDistance = 30,
      this.yDistance = 0.0});

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(
        AnimationType.opacity,
        Tween(begin: 0.0, end: 1.0),
        fadeDuration,
      )
      ..add(
        AnimationType.translateX,
        Tween(begin: xDistance, end: 1.0),
        xDuration,
      )
      ..add(
        AnimationType.translateY,
        Tween(begin: yDistance, end: 1.0),
        yDuration,
      );

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
            offset: Offset(value.get(AnimationType.translateX),
                value.get(AnimationType.translateY)),
            child: child),
      ),
    );
  }
}
