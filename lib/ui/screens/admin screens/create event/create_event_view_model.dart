import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/models/user/user.dart';

class CreateEventViewModel extends BaseViewModel {
  final log = getLogger("Create Event View Model");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = locator<NavigationService>();
  // final UsersRepository _usersRepository = locator<UsersRepository>();
  // final AuthService _authService = locator<AuthService>();
  // final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  UserModel userModel;

  goBack() {
    _navigationService.back();
  }

  createEvent() async {
    setBusy(true);
    Event event = Event(
        name: titleController.text,
        organiser: "",
        place: "",
        timeStamp: DateTime.now(),
        imageUrl: "",
        description: descController.text);
    log.d(event);
    setBusy(false);
  }

  init() {
  }
}
