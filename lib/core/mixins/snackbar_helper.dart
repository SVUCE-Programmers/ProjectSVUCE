import 'dart:io';

import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/setupSnackbarUi.dart';
import 'package:svuce_app/app/strings.dart';

mixin SnackbarHelper {
  final SnackbarService _snackbarService = locator<SnackbarService>();

  Future<bool> showExitSnackbar() async {
    _snackbarService.showCustomSnackBar(
        variant: SnackBarType.floating,
        title: confirmExitInfo,
        duration: Duration(seconds: 5),
        message: confirmExitMessage,
        mainButtonTitle: "Exit",
        onMainButtonTapped: () => exit(0));

    return false;
  }

  showInfoMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
      variant: SnackBarType.floating,
      title: title ?? "",
      // icon: Icon(FontAwesome5Solid.frown_open, color: Colors.orange),
      duration: Duration(seconds: 5),
      message: message ?? "",
    );
  }

  showErrorMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
      variant: SnackBarType.floating,

      title: title ?? "Error Occured!",
      // icon: Icon(FontAwesome5Solid.sad_tear, color: Colors.red),
      duration: Duration(seconds: 5),
      message: message ?? "Please try again",
    );
  }

  showSuccessMessage({String title, String message}) async {
    _snackbarService.showCustomSnackBar(
      variant: SnackBarType.floating,

      title: title,
      // icon: Icon(
      //   FontAwesome5Solid.smile_beam,
      //   color: uiHelpers.primaryColor,
      // ),
      duration: Duration(seconds: 5),
      message: message,
    );
  }
}
