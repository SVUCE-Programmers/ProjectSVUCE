import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';

mixin SnackbarHelper {
  final SnackbarService _snackbarService = locator<SnackbarService>();

  Future<bool> showExitSnackbar() async {
    await _snackbarService.showCustomSnackBar(
        title: confirmExitInfo,
        duration: Duration(seconds: 5),
        message: confirmExitMessage,
        backgroundColor: surfaceColor,
        mainButton: FlatButton(
          textColor: textPrimaryColor,
          onPressed: () {
            exit(0);
          },
          child: Text("Yes"),
        ));

    return false;
  }

  showInfoMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
        title: title,
        icon: Icon(FontAwesome5Solid.frown_open, color: Colors.orange),
        duration: Duration(seconds: 5),
        overlayBlur: 1.0,
        message: message,
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        borderRadius: 10.0,
        backgroundColor: surfaceColor,
        isDismissible: false);
  }

  showErrorMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
        title: title,
        icon: Icon(FontAwesome5Solid.sad_tear, color: Colors.red),
        duration: Duration(seconds: 5),
        overlayBlur: 1.0,
        message: message,
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        borderRadius: 10.0,
        backgroundColor: surfaceColor,
        isDismissible: false);
  }

  showSuccessMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
        title: title,
        icon: Icon(
          FontAwesome5Solid.smile_beam,
          color: primaryColor,
        ),
        duration: Duration(seconds: 5),
        overlayBlur: 1.0,
        message: message,
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        borderRadius: 10.0,
        backgroundColor: surfaceColor,
        isDismissible: false);
  }
}
