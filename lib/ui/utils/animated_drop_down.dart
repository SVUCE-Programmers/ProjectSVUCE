import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';

class AnimatedDropdownWidget extends HookWidget {
  final String title;
  final String hintText;
  final Function(String) validator;
  final Widget prefixIcon;
  final bool enabled;
  final Widget suffixIcon;
  final int maxLines;
  final List<String> items;
  final double delay;
  final TextInputType textInputType;
  final double xDistance, yDistance;
  final Function onTap;
  final double downPadding;
  final Duration xDuration, yDuration, fadeDuration;
  final Widget rowWidget;
  final TextEditingController textEditingController;

  const AnimatedDropdownWidget(
      {Key key,
      @required this.title,
      this.items,
      this.hintText,
      this.validator,
      this.rowWidget = const SizedBox(),
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.downPadding = 15,
      this.suffixIcon,
      @required this.textEditingController,
      this.maxLines = 1,
      this.onTap,
      this.delay = 0.75,
      this.xDuration = const Duration(milliseconds: 454),
      this.yDuration = const Duration(milliseconds: 454),
      this.fadeDuration = const Duration(milliseconds: 454),
      this.xDistance = 0,
      this.yDistance = 30,
      this.enabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return FadeAnimation(
      delay: delay,
      xDistance: xDistance,
      yDistance: yDistance,
      yDuration: yDuration,
      xDuration: xDuration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title == ""
                  ? SizedBox()
                  : Text(
                      "$title",
                    ),
              rowWidget
            ],
          ),
          SizedBox(height: 5),
          DropdownButtonFormField(
              isDense: true,
              value: items.contains(textEditingController.text)
                  ? textEditingController.text
                  : null,
              validator: validator ??
                  (value) {
                    if (value.isEmpty) {
                      return "Please enter $title";
                    }
                    return null;
                  },
              isExpanded: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: uiHelpers.surfaceColor,
                filled: true,
                hintText: hintText ??
                    "Enter ${title.toLowerCase().replaceAll("*", "")}",
                focusColor: Colors.white,
              ),
              onChanged: (value) {
                textEditingController.text = value;
              },
              items: (items ?? [])
                  .map((e) => DropdownMenuItem(child: Text(e), value: e))
                  .toList()),
          SizedBox(
            height: downPadding,
          ),
        ],
      ),
    );
  }
}
