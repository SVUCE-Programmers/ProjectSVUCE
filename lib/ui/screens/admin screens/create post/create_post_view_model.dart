import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';

class CreatePostViewModel extends BaseViewModel {
  final log = getLogger("Create Post View Model");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = locator<NavigationService>();
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
}
