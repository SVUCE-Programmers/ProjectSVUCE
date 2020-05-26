import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/models/annnouncement.dart';
import 'package:svuce_app/services/firestore/announcement_service.dart';

import 'mock_data.dart';

main() {
  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();

  final AnnouncementService announcementService =
      AnnouncementService(mockFirestoreInstance);

  group("Announcement Service Test", () {
    test("Get Stream of Announcements", () async {
      /// Adding Mock Announcement Data to
      /// Mock Firestore Instance
      await mockFirestoreInstance
          .collection("announcements")
          .add(mockAnnouncementList[0]);

      await mockFirestoreInstance
          .collection("announcements")
          .add(mockAnnouncementList[1]);

      Stream announcementStream = announcementService.getAnnouncements();

      announcementStream.listen((event) {
        List<Announcement> announcements = event;

        for (var i = 0; i < announcements.length; i++) {
          expect(verifyData(announcements[i], i), true);
        }
      });
    });
  });
}

bool verifyData(Announcement announcement, int index) {
  var mockData = mockAnnouncementList[index];

  return announcement.desc == mockData['desc'] &&
      announcement.imgUrl == mockData['imgUrl'] &&
      announcement.timeStamp == mockData['timeStamp'] &&
      announcement.type == mockData['type'];
}
