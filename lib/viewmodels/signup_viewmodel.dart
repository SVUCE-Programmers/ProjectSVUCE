import 'package:flutter/material.dart';
import 'package:svuce_app/constants/route_paths.dart';
import 'package:svuce_app/locator.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/services/base_auth.dart';
import 'package:svuce_app/services/dialog_service.dart';
import 'package:svuce_app/services/firestore_service.dart';
import 'package:svuce_app/services/navigation_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class SignUpViewModel extends BaseModel {
  final GlobalKey<FormState> _pageOneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _pageTwoFormKey = GlobalKey<FormState>();

  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final AuthenticationService _authenticationService = locator<BaseAuth>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final rollNoController = TextEditingController();
  final fullNameController = TextEditingController();

  GlobalKey<FormState> get pageOneForm => _pageOneFormKey;
  GlobalKey<FormState> get pageTwoForm => _pageTwoFormKey;

  int currentIndex = 0;

  Future gotoNextPage() async {
    bool validateResult = _pageOneFormKey.currentState.validate();

    if (!validateResult) {
      return null;
    }

    String rollNo = rollNoController.text;

    setBusy(true);

    var isRollExists = await _firestoreService.isRollNoExists(rollNo);

    setBusy(false);

    if (isRollExists is bool) {
      if (isRollExists) {
        await _dialogService.showDialog(
            title: 'Try Login',
            buttonTitle: 'Okay',
            cancelTitle: '',
            description: "The Roll No. already exists");

        return null;
      }
    } else {
      await _dialogService.showDialog(
          title: 'Try again', description: isRollExists);
      return isRollExists;
    }

    return _movePage();
  }

  Future createUser() async {
    bool validateResult = _pageTwoFormKey.currentState.validate();

    if (!validateResult) {
      return null;
    }

    String email = emailController.text;
    String password = passwordController.text;
    String password2 = confirmPasswordController.text;
    String fullName = fullNameController.text;
    String rollNo = rollNoController.text;

    //TODO: Do an API Call to check whether email is allowed to register

    if(password != password2){
      _dialogService.showDialog(
        title: "Try Again",
        description: "Passwords dont matched, check them and try again",
        buttonTitle: "Okay"
      );
      return null;
    }

    setBusy(true);

    var result = await _authenticationService.createStudent(
        fullName: fullName, rollNo: rollNo, email: email, password: password);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Try again',
          description: 'General signup failure, please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
          title: 'Try again', description: result);
    }
  }

  gotoLogin() {
    _navigationService.navigateTo(LoginViewRoute, arguments: true);
  }

  String validateEmail(String email) {
    if (email.isEmpty) {
      return 'Please Enter Your Email';
    } else if (email.length < 5) {
      return 'Your email must be atleast 6';
    }
    return null;
  }

  String validatePassword(String password) {
    if (password.isEmpty) {
      return 'Please Enter Your Password';
    } else if (password.length < 5) {
      return 'Your password must be atleast 6';
    }
    return null;
  }

  String validateRollNo(String rollNo) {
    //TODO: Validate Roll No. using Regex
    if (rollNo.isEmpty) {
      return 'Please enter your rollno.';
    } else if (rollNo.length > 8 || rollNo.length < 8) {
      return 'Please enter a valid rollno.';
    }
    return null;
  }

  String validateName(String name) {
    if (name.isEmpty) {
      return 'Please Enter Your Name';
    } else if (name.length < 5) {
      return 'Your Name must be atleast 6';
    }
    return null;
  }

  void _movePage() {
    currentIndex = 1;
    notifyListeners();
  }
  
  void goBack() {
    currentIndex = 0;
    notifyListeners();
  }
}
