import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/app/router.gr.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/app/strings.dart';
import 'package:svuce_app/services/auth/auth_service.dart';

import 'package:svuce_app/services/auth/auth_service_impl.dart';
import 'package:svuce_app/services/auth/auth_service_impl.dart';
import 'package:svuce_app/services/cloud_storage_service.dart';
import 'package:svuce_app/services/firestore/user_service.dart';
import 'package:svuce_app/utils/image_selector.dart';

class CreateProfileViewModel extends BaseViewModel {
  // Services
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final AuthServiceImpl _authenticationService =
      locator<AuthService>();
  final UserService _userService = locator<UserService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final ImageSelector imageSelector = ImageSelector();

  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  PageController get pageController => _pageController;

  // TextEditingControllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  //Form keys for validation
  final GlobalKey<FormState> _basicDetails = GlobalKey<FormState>();
  final GlobalKey<FormState> _contactDetails = GlobalKey<FormState>();

  GlobalKey<FormState> get basicDetailsFormKey => _basicDetails;
  GlobalKey<FormState> get contactDetailsFormKey => _contactDetails;

  File profileImage;

  int currentPage = 0;

  bool showBottomBar = false;

  String _email = "";
  String _password = "";

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  void moveForward() async {
    showBottomBar = false;

    bool result = handleValidation();

    if (!result) {
      return null;
    }

    if (currentPage == 1) {
      result = await rollNoCheck();

      if (!result) {
        return null;
      }
    }

    if (currentPage == 2) {
      return createUser();
    }

    await _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 2),
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

  removePhoto() {
    profileImage?.delete();
    profileImage = null;
    showBottomBar = false;
    notifyListeners();
  }

  bool handleValidation() {
    if (currentPage == 1) {
      bool result = basicDetailsFormKey.currentState.validate();

      return result;
    } else if (currentPage == 2) {
      bool result = contactDetailsFormKey.currentState.validate();

      return result;
    } else {
      return true;
    }
  }

  void createUser() async {
    String fullName = fullNameController.text;
    String contact = contactController.text;
    String rollNo = rollNoController.text;
    String bio = bioController.text;
    String profileImgURL =
        "https://www.tenforums.com/geek/gars/images/2/types/thumb__ser.png";

    setBusy(true);

    if (profileImage != null) {
      profileImgURL = await uploadImage();
    }

    var result = await _authenticationService.createStudent(
        email: _email,
        password: _password,
        fullName: fullName,
        rollNo: rollNo,
        contact: contact,
        profileImg: profileImgURL,
        bio: bio);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(Routes.selectClubsViewRoute,
            arguments: SelectClubsViewArguments(isSelectClubs: true));
      } else {
        await _snackbarService.showCustomSnackBar(
          duration: Duration(seconds: 5),
          title: commonErrorTitle,
          message: commonErrorInfo,
          icon: Icon(
            infoIcon,
            color: errorColor,
          ),
        );
      }
    } else {
      await _snackbarService.showCustomSnackBar(
        duration: Duration(seconds: 5),
        title: commonErrorTitle,
        message: result,
        icon: Icon(
          infoIcon,
          color: errorColor,
        ),
      );
    }
  }

  void init(String email, String password) {
    _email = email;
    _password = password;
  }

  Future rollNoCheck() async {
    String rollNo = rollNoController.text;

    setBusy(true);

    var isRollExists = await _userService.isRollNoExists(rollNo);

    setBusy(false);

    if (!(isRollExists is bool)) {
      return false;
    }

    if (isRollExists) {
      await _snackbarService.showCustomSnackBar(
        title: commonErrorTitle,
        message: "The Roll no. already exists try login",
        duration: Duration(seconds: 3),
        icon: Icon(
          infoIcon,
          color: errorColor,
        ),
      );

      return false;
    }

    return true;
  }

  Future uploadImage() async {
    var result =
        await _cloudStorageService.uploadImage(imageToUpload: profileImage);

    return result?.imageUrl;
  }
}
