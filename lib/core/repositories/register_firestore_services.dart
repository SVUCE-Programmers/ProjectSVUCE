import 'package:injectable/injectable.dart';

import 'announcement_service.dart';
import 'clubs_service.dart';
import 'event_service.dart';
import 'feed_service.dart';
import 'user_club_service.dart';
import 'user_service.dart';

@module
abstract class RegisterRepos {
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
