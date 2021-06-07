import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/app/AppSetup.logger.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/models/user/user.dart';
import 'package:svuce_app/core/repositories/events_repository/events_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';

class CreateEventViewModel extends BaseViewModel {
  final log = getLogger("Create Event View Model");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final EventsRepository _eventsRepository = locator<EventsRepository>();
  // final UsersRepository _usersRepository = locator<UsersRepository>();
  // final AuthService _authService = locator<AuthService>();
  // final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController placeController = TextEditingController();

  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  UserModel userModel;

  goBack() {
    _navigationService.back();
  }

  createEvent() async {
    if (formKey.currentState.validate()) {
      setBusy(true);
      Event event = Event(
          name: titleController.text,
          organiser: _authService.currentUser.fullName,
          place: placeController.text,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          startTime: DateTime.now().millisecondsSinceEpoch,
          endTime: DateTime.now().millisecondsSinceEpoch,
          imageUrl: "",
          description: descController.text);
      log.d(event);
      bool res = await _eventsRepository.createEvent(event);
      if (res) {
        _navigationService.back();
      }
      setBusy(false);
    }
  }

  init() {}
}
