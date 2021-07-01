import 'dart:io';

import 'package:flutter/material.dart';
import 'package:svuce_app/core/utils/ui_helpers.dart';

Future showExitDialog(BuildContext context) async {
  UiHelpers uiHelpers = UiHelpers.fromContext(context);
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: uiHelpers.surfaceColor,
            title: Text(
              "Are you sure want to exit app?",
              style: uiHelpers.title,
            ),
            contentPadding: EdgeInsets.zero,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: uiHelpers.body
                        .copyWith(color: uiHelpers.textSecondaryColor),
                  )),
              TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: Text(
                    "Exit",
                    style: uiHelpers.button
                        .copyWith(color: uiHelpers.primaryColor),
                  ))
            ],
          ));
}
