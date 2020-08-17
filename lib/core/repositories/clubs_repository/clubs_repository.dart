abstract class ClubsRepository {
  Stream getClubs();
  Future followClub(String clubId, String userId);
}
