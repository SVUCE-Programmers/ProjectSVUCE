import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';

class AnimatedInputField extends StatelessWidget {
  final String title;
  final String hintText;
  final Function(String) validator;
  final Widget prefixIcon;
  final bool enabled;
  final Widget suffixIcon;
  final int maxLines;
  final TextEditingController textEditingController;
  final double delay;
  final double xDistance, yDistance;
  final Function onTap;
  final double downPadding;

  const AnimatedInputField(
      {Key key,
      @required this.title,
      this.hintText,
      this.validator,
      this.prefixIcon,
      this.downPadding = 15,
      this.suffixIcon,
      this.maxLines = 1,
      @required this.textEditingController,
      this.onTap,
      this.delay = 0.75,
      this.xDistance = 0,
      this.yDistance = 30,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAnimation(
          delay: delay,
          xDistance: xDistance,
          yDistance: yDistance,
          child: Text(
            "$title",
            style: uiHelpers.title.copyWith(fontSize: 14),
          ),
        ),
        SizedBox(height: 5),
        FadeAnimation(
          delay: delay + 0.2,
          xDistance: xDistance,
          yDistance: yDistance,
          child: GestureDetector(
            onTap: onTap,
            child: TextFormField(
              enabled: enabled,
              maxLines: maxLines ?? 1,
              controller: textEditingController ?? TextEditingController(),
              validator: validator ??
                  (value) {
                    if (value.isEmpty) {
                      return "Please enter ${title.toLowerCase()}";
                    }
                    return null;
                  },
              decoration: InputDecoration(
                  prefixIconConstraints: BoxConstraints(
                      maxWidth: prefixIcon != null ? 40 : 15,
                      minWidth: prefixIcon != null ? 40 : 15),
                  suffixIconConstraints: BoxConstraints(
                      maxWidth: suffixIcon != null ? 60 : 15,
                      minWidth: suffixIcon != null ? 60 : 15),
                  suffixIcon: Center(child: suffixIcon ?? SizedBox()),
                  prefixIcon: Center(child: prefixIcon ?? SizedBox()),
                  fillColor: uiHelpers.surfaceColor,
                  filled: true,
                  hintText: hintText ?? "Enter ${title.toLowerCase()}",
                  hintStyle: uiHelpers.body,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
          ),
        ),
        SizedBox(
          height: downPadding,
        ),
      ],
    );
  }
}
