import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';

class AnimatedButton extends HookWidget {
  final Function onTap;
  final Widget leading;
  final Widget trailing;
  final Widget title;
  final double delay, xDistance, yDistance;
  final double elevation, minLeadingWidth, animatePaddingValue;
  final ShapeBorder shapeBorder;
  final Duration paddingAnimationDuration;
  final MainAxisAlignment mainAxisAlignment;
  const AnimatedButton(
      {Key key,
      @required this.onTap,
      this.paddingAnimationDuration,
      this.leading,
      this.trailing,
      this.title,
      this.delay = 2,
      this.mainAxisAlignment,
      this.xDistance = 0,
      this.yDistance = 30,
      this.elevation,
      this.animatePaddingValue = 8,
      this.shapeBorder,
      this.minLeadingWidth = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = useState(EdgeInsets.all(0));

    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Listener(
      onPointerHover: (p) {
        padding.value = EdgeInsets.all(animatePaddingValue);
      },
      onPointerUp: (p) {
        padding.value = EdgeInsets.all(0);
      },
      child: AnimatedPadding(
        padding: padding.value,
        duration: paddingAnimationDuration ?? Duration(milliseconds: 400),
        child: FadeAnimation(
          delay: delay,
          xDistance: xDistance,
          yDistance: yDistance,
          child: Column(
            children: [
              MaterialButton(
                  enableFeedback: true,
                  elevation: elevation ?? 0,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: shapeBorder ??
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                  color: uiHelpers.primaryColor,
                  onPressed: onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment:
                          mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
                      children: [
                        leading ??
                            SizedBox(
                              width: 0,
                              height: 0,
                            ),
                        title,
                        trailing ??
                            SizedBox(
                              width: 0,
                              height: 0,
                            ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
