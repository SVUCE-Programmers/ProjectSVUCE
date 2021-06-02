import 'package:svuce_app/core/models/user/user.dart';

abstract class UsersRepository {
  Future storeUser(UserModel user);
  Future updateUser(Map<String, dynamic> userData);
  Future getUser(String email);
  Future isRollNoExists(String rollNo);
  Stream getUserFromStream(String email);
  void getUserDetailsFromPrefs();
  void addUserDetailsToPrefs(UserModel userModel);
  Future signupUser(String email);
}
