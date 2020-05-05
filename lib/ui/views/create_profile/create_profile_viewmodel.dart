import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/utils/image_selector.dart';

class CreateProfileViewModel extends BaseViewModel {
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  final SnackbarService _snackbarService = locator<SnackbarService>();

  final ImageSelector imageSelector = ImageSelector();

  PageController get pageController => _pageController;

  File profileImage;

  int currentPage = 0;

  bool showBottomBar = false;

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  void moveForward() async {
    showBottomBar = false;

    await _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 4),
        title: crossCheckInfo,
        message: crossCheckDetailsMessage);

    await _pageController.nextPage(
        duration: Duration(seconds: 1), curve: Curves.elasticOut);
  }

  void moveBackward() async {
    await _pageController.previousPage(
        duration: Duration(seconds: 1), curve: Curves.elasticOut);
  }

  void chooseImage() async {
    showBottomBar = true;
    setBusy(false);
  }

  selectImage({bool fromGallery = false}) async {
    File file = await imageSelector.selectImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera);

    if (file == null) {
      return null;
    }

    int size = await file.length();

    if (size > 1000000) {
      await _snackbarService.showCustomSnackBar(
          title: "OOPS",
          message: "The image you selected is > 1MB, please try again",
          duration: Duration(seconds: 5));

      return null;
    }

    profileImage = file;
    showBottomBar = false;

    notifyListeners();
  }
}
