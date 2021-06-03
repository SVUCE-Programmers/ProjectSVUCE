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

class CreatePostViewModel extends BaseViewModel {
  final log = getLogger("Create Post View Model");

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController urlController = TextEditingController();

  String type;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = locator<NavigationService>();
  final UsersRepository _usersRepository = locator<UsersRepository>();
  final AuthService _authService = locator<AuthService>();
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

  init() {
    _usersRepository.getUserFromStream(_authService.getEmail()).listen((event) {
      userModel = event;
      notifyListeners();
    });
  }

  createPost() async {
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
