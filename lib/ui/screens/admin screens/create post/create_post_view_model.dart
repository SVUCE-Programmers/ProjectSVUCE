import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/feed/feed.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/repositories/feed_repository/feed_repository.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:svuce_app/core/utils/image_selector.dart';

class CreatePostViewModel extends BaseViewModel {
  final log = getLogger("Create Post View Model");

  Feed feed;
  File file;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  String type;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = locator<NavigationService>();
  final UsersRepository _usersRepository = locator<UsersRepository>();
  final AuthService _authService = locator<AuthService>();
  final ImageSelector _imageSelector = ImageSelector();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  final FeedRepository _feedRepository = locator<FeedRepository>();
  UserModel userModel;
  goBack() {
    _navigationService.back();
  }

  handleFormValidation() {
    if (formKey.currentState.validate()) {
      log.i("Form is Valid");
      //?Handle Create Post function
      createPost();
    } else {
      log.e("Form is Invalid");
    }
  }

  changeType(String value) {
    type = value;
    notifyListeners();
  }

  init({Feed temp}) {
    if (temp != null) {
      feed = temp;
      titleController.text = feed.title;
      descController.text = feed.description;
      urlController.text = feed.link ?? "";
      type = feed.category;
      notifyListeners();
    }
    _usersRepository.getUserFromStream(_authService.getEmail()).listen((event) {
      userModel = event;
      notifyListeners();
    });
  }

  createPost() async {
    if (feed != null) {
      setBusy(true);
      feed = feed.copyWith(
          link: urlController.text,
          title: titleController.text,
          description: descController.text,
          category: type ?? "General");
      var data = await _feedRepository.updatePost(feed: feed);

      log.i(data);
      if (data is bool && data) {
        _navigationService.back();
      }

      setBusy(false);
    } else {
      setBusy(true);
      var data = await _feedRepository.createPost(
          feed: Feed(
        link: urlController.text,
        description: descController.text,
        title: titleController.text,
        category: type,
        fullName: _firebaseAuth.currentUser.displayName,
        profileImg: _firebaseAuth.currentUser.photoURL,
        uid: _firebaseAuth.currentUser.uid,
        timeStamp: DateTime.now().toString(),
      ));

      log.i(data);
      if (data is bool && data) {
        _navigationService.back();
      }

      setBusy(false);
    }
  }

  pickImage(String type) async {
    switch (type) {
      case "delete":
        file = null;
        notifyListeners();
        break;
      case "camera":
        file = await _imageSelector.pickImageFromCamera();
        notifyListeners();
        break;
      case "gallery":
        file = await _imageSelector.pickImageFromGallery();
        notifyListeners();
        break;
      default:
    }
    _navigationService.back();
  }
}
