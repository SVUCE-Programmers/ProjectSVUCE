import 'dart:io';

import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';

mixin WillPopHelper {
  final SnackbarService _snackbarService = locator<SnackbarService>();

  Future<bool> onWillPop() async {
    _snackbarService.showSnackbar(
        title: confirmExitInfo,
        duration: Duration(seconds: 5),
        message: confirmExitMessage,
        mainButtonTitle: "Exit",
        onMainButtonTapped: () => exit(0));

    return false;
  }
}
