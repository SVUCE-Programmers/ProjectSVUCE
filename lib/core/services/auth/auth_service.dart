import 'package:flutter/material.dart';
import 'package:svuce_app/core/models/user/user.dart';

abstract class AuthService {
  UserModel currentUser;
  Future loginUser({@required String email, @required String password});
  Future createStudent({
    @required String email,
    @required String password,
  });

  bool isUserLoggedIn();
  Future resetPassword(String email);
  Future signOut();
  Future updateUserProfile({String displayName, String profileImg});
  String getStudentPresentYear();
  String getUid();
  String getEmail();
}
