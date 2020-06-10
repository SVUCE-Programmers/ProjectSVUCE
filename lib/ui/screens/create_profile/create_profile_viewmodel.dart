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
import 'package:svuce_app/core/services/auth/auth_service.dart';

import 'package:svuce_app/core/services/cloud_storage/cloud_storage_service.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/utils/image_selector.dart';
import 'package:svuce_app/core/mixins/validators.dart';
import 'package:svuce_app/core/mixins/will_pop.dart';

class CreateProfileViewModel extends BaseViewModel
    with Validators, WillPopHelper {
  // Services
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final AuthService _authenticationService = locator<AuthService>();
  final UsersRepository _userService = locator<UsersRepository>();
  final NavigationService _navigationService = locator<NavigationService>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();

  final ImageSelector imageSelector = ImageSelector();

  void init(String email, String password) {
    _email = email;
    _password = password;
  }

  // Required Fields

  String _fullName;
  String get fullName => _fullName;
  String fullNameError = '';
  updateFullName(String fullName) {
    _fullName = fullName;
    fullNameError = validateName(fullName);
    notifyListeners();
  }

  String _rollNo;
  String get rollNo => _rollNo;
  String rollNoError = '';
  updateRollNo(String rollNo) {
    _rollNo = rollNo;
    rollNoError = validateRollNo(rollNo);
    notifyListeners();
  }

  String _contact;
  String get contact => _contact;
  String contactError = '';
  updateContact(String contact) {
    _contact = contact;
    contactError = validatePhoneNo(contact);
    notifyListeners();
  }

  String _bio;
  String get bio => _bio;
  updateBio(String bio) {
    _bio = bio;
    notifyListeners();
  }

  final String collegeName = "SVUCE";

  File profileImage;

  int currentPage = 0;

  bool showBottomBar = false;

  // For Signing up
  String _email = "";
  String _password = "";

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  void moveForward() {
    showBottomBar = false;

    bool validated = fullNameError.isEmpty &&
        rollNoError.isEmpty &&
        fullName.isNotEmpty &&
        rollNo.isNotEmpty;

    if (!validated) {
      return null;
    }

    currentPage++;

    notifyListeners();
  }

  void moveBackward() {
    currentPage--;
    notifyListeners();
  }

  createProfile() async {
    bool isValidated = fullNameError.isEmpty &&
        rollNoError.isEmpty &&
        contactError.isEmpty &&
        fullName.isNotEmpty &&
        rollNo.isNotEmpty &&
        contact.isNotEmpty;

    if (!isValidated) {
      print("OOPS");
      return null;
    }

    String profileImgURL =
        "https://www.tenforums.com/geek/gars/images/2/types/thumb__ser.png";

    setBusy(true);

    if (profileImage != null) {
      profileImgURL = await uploadImage();
    }

    var isRollNoExists = await rollNoCheck();

    if (!isRollNoExists) {
      return;
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

  void chooseImage() {
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

  Future rollNoCheck() async {
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

/// 1. Get the basic details with validation
/// 2. Store the image
/// 3. Get the contact details with validation
/// 4. After user has been okay to continue
///   a. Upload the image to cloud firestore
///   b. Create User
///   c. Move to home
