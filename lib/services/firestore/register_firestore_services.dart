import 'package:injectable/injectable.dart';
import 'package:svuce_app/services/firestore/announcement_service.dart';
import 'package:svuce_app/services/firestore/clubs_service.dart';
import 'package:svuce_app/services/firestore/event_service.dart';
import 'package:svuce_app/services/firestore/feed_service.dart';
import 'package:svuce_app/services/firestore/user_club_service.dart';
import 'package:svuce_app/services/firestore/user_service.dart';

@registerModule
abstract class RegisterFirestoreServices {
  @lazySingleton
  AnnouncementService get announcementService;

  @lazySingleton
  ClubsService get clubsService;

  @lazySingleton
  EventsService get eventsService;

  @lazySingleton
  FeedService get feedService;

  @lazySingleton
  UserService get userService;

  @lazySingleton
  UserClubService get userClubService;
}
