import 'package:svuce_app/core/models/user/user.dart';

abstract class ClubsRepository {
  Stream getClubs();
  Future followClub(String clubId, UserModel userModel);
}
