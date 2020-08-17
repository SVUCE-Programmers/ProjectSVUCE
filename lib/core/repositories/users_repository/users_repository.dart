import 'package:svuce_app/core/models/user/user.dart';

abstract class UsersRepository {
  Future storeUser(User user);
  Future getUser(String userId);
  Future isRollNoExists(String rollNo);
}
