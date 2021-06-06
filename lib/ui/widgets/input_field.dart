import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:svuce_app/core/utils/ui_helpers.dart';

class InputField extends HookWidget {
  final String title;
  final bool autoFocus;
  final String error;
  final TextInputType keyboardType;
  final bool isSecure;
  final int maxLength;
  final int maxLines;
  final Function(String) validator;

  final IconData iconData;

  const InputField(
      {Key key,
      this.title,
      this.error = '',
      this.keyboardType,
      this.autoFocus = false,
      this.iconData,
      this.isSecure = false,
      this.maxLength,
      this.maxLines = 1,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    focusNode.addListener(() {});
    final showPassword = useState(false);
    final uiHelpers = UiHelpers.fromContext(context);
    return Container(
      padding: EdgeInsets.all(6.0),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: uiHelpers.surfaceColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        autofocus: autoFocus,
        focusNode: focusNode,
        maxLength: maxLength ?? null,
        style: uiHelpers.body.copyWith(color: uiHelpers.textSecondaryColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              iconData,
            ),
            suffixIcon: isSecure
                ? IconButton(
                    splashRadius: 1,
                    padding: const EdgeInsets.all(0),
                    onPressed: () => showPassword.value = !showPassword.value,
                    icon: Icon(showPassword.value
                        ? FlutterIcons.eye_off_outline_mco
                        : FlutterIcons.eye_fea),
                  )
                : SizedBox(),
            hintText: title,
            hintStyle: uiHelpers.body.copyWith(
              color: uiHelpers.textSecondaryColor,
            ),
            errorText: error.isEmpty ? null : error),
        maxLines: maxLines,
        obscureText: isSecure && !showPassword.value,
        onChanged: validator ?? null,
        keyboardType: keyboardType,
      ),
    );
  }
}
