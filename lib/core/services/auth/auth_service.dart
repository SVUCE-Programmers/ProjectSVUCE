import 'package:flutter/material.dart';
import 'package:svuce_app/core/models/user/user.dart';

abstract class AuthService {
  UserModel currentUser;
  bool hasAdminAccess;
  bool isGuest;
  Future loginUser({@required String email, @required String password});
  Future createStudent({
    @required String email,
    @required String password,
  });
  listenAuthStatusStream();

  bool isUserLoggedIn();
  Future resetPassword(String email);
  Future signOut();
  Future updateUserProfile({String displayName, String profileImg});
  String getStudentPresentYear();
  String getUid();
  String getEmail();
  Future changePassword(String password);
}
