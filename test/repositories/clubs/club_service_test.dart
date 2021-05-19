import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/club/club.dart';
import 'package:svuce_app/core/repositories/clubs_repository/clubs_repository.dart';

import 'mock_data.dart';

main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    locator.allowReassignment = true;
  });

  group("Clubs Service Test", () {
    test("Get Stream of Clubs", () async {
      final MockFirestoreInstance mockFirestoreInstance =
          MockFirestoreInstance();

      /// Adding Mock Club Data to
      /// Mock Firestore Instance
      await mockFirestoreInstance
          .collection("clubs")
          .doc(mockClubData[0]['id'])
          .set(mockClubData[0]);

      await mockFirestoreInstance
          .collection("clubs")
          .doc(mockClubData[1]['id'])
          .set(mockClubData[1]);

      locator.registerSingleton<FirebaseFirestore>(mockFirestoreInstance);
      final ClubsRepository _clubsRepo = locator<ClubsRepository>();

      Stream announcementStream = _clubsRepo.getClubs();

      announcementStream.listen((event) {
        List<Club> clubs = event;

        for (var i = 0; i < clubs.length; i++) {
          expect(verifyData(clubs[i], i), true);
        }
      });
    });

    test("Follow Club", () async {
      String clubId = "clubId1";
      String userId = "userId";

      final MockFirestoreInstance mockFirestoreInstance =
          MockFirestoreInstance();

      locator.registerSingleton<FirebaseFirestore>(mockFirestoreInstance);
      final ClubsRepository _clubsRepo = locator<ClubsRepository>();

      expect(await _clubsRepo.followClub(clubId, userId), true);
    });
  });
}

bool verifyData(Club club, int index) {
  var mockData = mockClubData[index];

  return club.name == mockData['name'] &&
      club.moto == mockData['moto'] &&
      club.clubBanner == mockData['clubBanner'] &&
      club.clubLogo == mockData['clubLogo'] &&
      club.description == mockData['description'] &&
      club.followers == mockData['followers'];
}
