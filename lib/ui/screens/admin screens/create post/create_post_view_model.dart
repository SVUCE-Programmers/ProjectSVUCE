import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

class CreatePostViewModel extends BaseViewModel {
  final log = getLogger("Create Post View Model");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = locator<NavigationService>();
  final UsersRepository _usersRepository = locator<UsersRepository>();
  final AuthService _authService = locator<AuthService>();
  UserModel userModel;
  goBack() {
    _navigationService.back();
  }

  handleFormValidation() {
    if (formKey.currentState.validate()) {
      log.i("Form is Valid");
      //?Handle Create Post function
    } else {
      log.e("Form is Invalid");
    }
  }

  init() {
    _usersRepository.getUserFromStream(_authService.getEmail()).listen((event) {
      userModel = event;
      notifyListeners();
    });
  }
}
