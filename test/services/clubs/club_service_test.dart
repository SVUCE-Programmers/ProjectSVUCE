import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/models/club.dart';
import 'package:svuce_app/services/firestore/clubs_service.dart';

import 'mock_data.dart';

main() {
  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();

  final ClubsService clubsService = ClubsService(mockFirestoreInstance);

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
      club.topicId == mockData['topicId'] &&
      club.followers == mockData['followers'];
}
