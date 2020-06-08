import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/app/locator.dart';
import 'package:svuce_app/core/models/event/event.dart';
import 'package:svuce_app/core/services/firestore/event_service.dart';

import 'mock_data.dart';

main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    setupLocator();
    locator.allowReassignment = true;
  });

  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();

  group("Events Service Test", () {
    test("Get Stream of Events", () async {
      /// Adding Mock Event Data to
      /// Mock Firestore Instance
      await mockFirestoreInstance
          .collection("events")
          .document(mockEventsData[0]['id'])
          .setData(mockEventsData[0]);

      await mockFirestoreInstance
          .collection("events")
          .document(mockEventsData[1]['id'])
          .setData(mockEventsData[1]);

      locator.registerSingleton<Firestore>(mockFirestoreInstance);
      final EventsService clubsService = locator<EventsService>();

      Stream announcementStream = clubsService.getEvents();

      announcementStream.listen((event) {
        List<Event> events = event;

        for (var i = 0; i < events.length; i++) {
          expect(verifyData(events[i], i), true);
        }
      });
    });
  });
}

bool verifyData(Event club, int index) {
  var mockData = mockEventsData[index];

  return club.name == mockData['name'] &&
      club.description == mockData['description'] &&
      club.organiser == mockData['organiser'] &&
      club.timeStamp == mockData['timeStamp'] &&
      club.place == mockData['place'] &&
      club.imageUrl == mockData['imageUrl'];
}
