import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';
import 'package:svuce_app/ui/widgets/animations/fade_transition.dart';

class AnimatedDropdown extends HookWidget {
  final String title;
  final String hintText;
  final Function(String) validator;
  final Widget prefixIcon;
  final bool enabled;
  final Widget suffixIcon;
  final int maxLines;
  final TextEditingController textEditingController;
  final double delay;
  final List<String> items;
  final TextInputType textInputType;
  final double xDistance, yDistance;
  final Function onTap;
  final FocusNode focusNode;
  final double downPadding;
  final Duration xDuration, yDuration, fadeDuration;

  final bool isObscure;

  const AnimatedDropdown(
      {Key key,
      @required this.title,
      this.hintText,
      this.isObscure = false,
      this.validator,
      this.focusNode,
      this.items = const [],
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.downPadding = 15,
      this.suffixIcon,
      this.maxLines = 1,
      @required this.textEditingController,
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
    final showPassword = useState(false);
    final UiHelpers uiHelpers = UiHelpers.fromContext(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeAnimation(
          delay: delay,
          xDuration: xDuration,
          yDuration: yDuration,
          fadeDuration: fadeDuration,
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
            child: DropdownButtonFormField(
              dropdownColor: uiHelpers.backgroundColor,
              value: textEditingController.text == ""
                  ? null
                  : textEditingController.value,
              onChanged: (value) {
                textEditingController.text = value;
              },
              onSaved: (value) {
                textEditingController.text = value;
              },
              isDense: true,
              isExpanded: true,
              focusNode: focusNode ?? FocusNode(),
              items: items
                  .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: uiHelpers.title,
                      )))
                  .toList(),
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
                      maxWidth: isObscure
                          ? 60
                          : suffixIcon != null
                              ? 60
                              : 15,
                      minWidth: suffixIcon != null ? 60 : 15),
                  suffixIcon: isObscure
                      ? IconButton(
                          splashRadius: 0.1,
                          onPressed: () {
                            showPassword.value = !showPassword.value;
                          },
                          icon: Icon(
                            showPassword.value
                                ? FlutterIcons.eye_off_fea
                                : FlutterIcons.eye_fea,
                            color: uiHelpers.textSecondaryColor,
                          ))
                      : Center(child: suffixIcon ?? SizedBox()),
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
