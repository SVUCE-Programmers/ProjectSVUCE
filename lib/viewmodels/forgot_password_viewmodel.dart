import 'package:flutter/material.dart';
import 'package:svuce_app/services/authentication_service.dart';
import 'package:svuce_app/viewmodels/base_model.dart';

class ForgotViewModel extends BaseModel{
  final emailTextEditingController=TextEditingController();
  final AuthenticationService _authenticationService=AuthenticationService();
  void resetPass()async{
    setBusy(true);
    await _authenticationService.resetPassword(emailTextEditingController.text); 
    setBusy(false);
  }
  String validate(String email){
    RegExp reg= RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(reg.hasMatch(email)){
      return null;
    }
    return "Email is not valid";
  }
}