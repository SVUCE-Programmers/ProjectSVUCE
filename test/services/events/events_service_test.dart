import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svuce_app/models/event.dart';
import 'package:svuce_app/services/firestore/event_service.dart';

import 'mock_data.dart';

main() {
  final MockFirestoreInstance mockFirestoreInstance = MockFirestoreInstance();

  final EventsService clubsService = EventsService(mockFirestoreInstance);

  group("Events Service Test", () {
    test("Get Stream of Events", () async {
      /// Adding Mock Event Data to
      /// Mock Firestore Instance
      await mockFirestoreInstance.collection("events").add(mockEventsData[0]);

      await mockFirestoreInstance.collection("events").add(mockEventsData[1]);

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

  return club.eventName == mockData['eventName'] &&
      club.description == mockData['description'] &&
      club.organiser == mockData['organiser'] &&
      club.timeStamp == mockData['timeStamp'] &&
      club.place == mockData['place'] &&
      club.imageUrl == mockData['imageUrl'];
}
