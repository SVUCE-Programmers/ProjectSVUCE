import 'package:flutter/material.dart';

abstract class AuthService {
  Future loginUser({@required String email, @required String password});
  Future createStudent(
      {@required String email,
      @required String password,
      @required String fullName,
      @required String rollNo,
      @required String contact,
      @required String profileImg,
      @required String bio});

  Future<bool> isUserLoggedIn();
  Future resetPassword(String email);
  Future signOut();
  Future updateUserProfile({String displayName, String profileImg});
}
