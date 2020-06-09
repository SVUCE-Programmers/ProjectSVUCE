import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/announcement/announcement.dart';
import 'package:svuce_app/core/repositories/announcement_service.dart';

import 'mock_data.dart';

main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    locator.allowReassignment = true;
  });

  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();

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

      locator.registerSingleton<Firestore>(mockFirestoreInstance);

      final AnnouncementService announcementService =
          locator<AnnouncementService>();

      Stream announcementStream = announcementService.getAnnouncements();

      announcementStream.listen((event) {
        List<Announcement> announcements = event;

        for (var i = 0; i < announcements.length; i++) {
          expect(_verifyData(announcements[i], i), true);
        }
      });
    });
  });
}

bool _verifyData(Announcement announcement, int index) {
  var mockData = mockAnnouncementList[index];

  return announcement.desc == mockData['desc'] &&
      announcement.imgUrl == mockData['imgUrl'] &&
      announcement.timeStamp == mockData['timeStamp'] &&
      announcement.type == mockData['type'];
}
