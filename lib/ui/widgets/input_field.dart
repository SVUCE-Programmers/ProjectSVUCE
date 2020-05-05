import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';

class InputField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isSecure;
  final int maxLength;
  final int maxLines;
  final Function(String) validator;

  final IconData iconData;

  const InputField(
      {Key key,
      this.title,
      this.controller,
      this.keyboardType,
      this.iconData,
      this.isSecure = false,
      this.maxLength,
      this.maxLines,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiHelpers = UIHelpers.fromContext(context);
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
          color: surfaceColor, borderRadius: BorderRadius.circular(10.0)),
      child: TextFormField(
        controller: controller ?? null,
        maxLength: maxLength ?? null,
        style: uiHelpers.body.copyWith(color: textSecondaryColor),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            iconData,
            color: primaryColor,
          ),
          hintText: title,
          hintStyle: uiHelpers.body.copyWith(
            color: textSecondaryColor,
          ),
        ),
        maxLines: maxLines,
        obscureText: isSecure,
        validator: validator ?? null,
        keyboardType: keyboardType,
      ),
    );
  }
}
