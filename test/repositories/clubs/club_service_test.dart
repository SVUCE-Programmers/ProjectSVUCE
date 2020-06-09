import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/club/club.dart';
import 'package:svuce_app/core/repositories/clubs_service.dart';

import 'mock_data.dart';

main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    locator.allowReassignment = true;
  });

  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();

  group("Clubs Service Test", () {
    test("Get Stream of Clubs", () async {
      /// Adding Mock Club Data to
      /// Mock Firestore Instance
      await mockFirestoreInstance
          .collection("clubs")
          .document(mockClubData[0]['id'])
          .setData(mockClubData[0]);

      await mockFirestoreInstance
          .collection("clubs")
          .document(mockClubData[1]['id'])
          .setData(mockClubData[1]);

      locator.registerSingleton<Firestore>(mockFirestoreInstance);
      final ClubsService clubsService = locator<ClubsService>();

      Stream announcementStream = clubsService.getClubs();

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

      locator.registerSingleton<Firestore>(mockFirestoreInstance);
      final ClubsService clubsService = locator<ClubsService>();

      expect(await clubsService.followClub(clubId, userId), true);
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
