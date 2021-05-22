import 'package:flutter/material.dart';

import 'package:svuce_app/core/utils/ui_helpers.dart';

class InputField extends StatelessWidget {
  final String title;
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
      this.iconData,
      this.isSecure = false,
      this.maxLength,
      this.maxLines = 1,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiHelpers = UiHelpers.fromContext(context);
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: uiHelpers.surfaceColor,
          borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        maxLength: maxLength ?? null,
        style: uiHelpers.body.copyWith(color: uiHelpers.textSecondaryColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              iconData,
              color: uiHelpers.primaryColor,
            ),
            hintText: title,
            hintStyle: uiHelpers.body.copyWith(
              color: uiHelpers.textSecondaryColor,
            ),
            errorText: error.isEmpty ? null : error),
        maxLines: maxLines,
        obscureText: isSecure,
        onChanged: validator ?? null,
        keyboardType: keyboardType,
      ),
    );
  }
}
