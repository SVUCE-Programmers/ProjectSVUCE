import 'package:svuce_app/core/models/user_club/user_club.dart';

abstract class UserClubsRepository {
  Future addClubToUser(UserClub userClub, String userId);
  Stream getUserClubs(String userId);
}
