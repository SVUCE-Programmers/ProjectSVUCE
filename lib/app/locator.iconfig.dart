// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:svuce_app/services/api_service.dart';
import 'package:svuce_app/services/firestore/announcement_service.dart';
import 'package:svuce_app/services/firestore/register_firestore_services.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';
import 'package:svuce_app/services/auth_service.dart';
import 'package:http/src/client.dart';
import 'package:svuce_app/services/register_dependencies.dart';
import 'package:svuce_app/services/cloud_storage_service.dart';
import 'package:svuce_app/services/firestore/clubs_service.dart';
import 'package:svuce_app/services/firestore/event_service.dart';
import 'package:svuce_app/services/firestore/feed_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/ui/views/login/login_viewmodel.dart.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/services/register_third_party_services.dart';
import 'package:svuce_app/services/push_notification_service.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/services/firestore/user_club_service.dart';
import 'package:svuce_app/services/firestore/user_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerFirestoreServices = _$RegisterFirestoreServices();
  final registerDependencies = _$RegisterDependencies();
  final registerExternalServices = _$RegisterExternalServices();
  g.registerLazySingleton<APIService>(() => APIService());
  g.registerLazySingleton<AnnouncementService>(
      () => registerFirestoreServices.announcementService);
  g.registerLazySingleton<AttendanceService>(() => AttendanceService());
  g.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  g.registerLazySingleton<Client>(() => registerDependencies.client);
  g.registerLazySingleton<CloudStorageService>(() => CloudStorageService());
  g.registerLazySingleton<ClubsService>(
      () => registerFirestoreServices.clubsService);
  g.registerLazySingleton<EventsService>(
      () => registerFirestoreServices.eventsService);
  g.registerLazySingleton<FeedService>(
      () => registerFirestoreServices.feedService);
  g.registerLazySingleton<FirebaseAuth>(
      () => registerDependencies.firebaseAuth);
  g.registerLazySingleton<Firestore>(() => registerDependencies.firestore);
  g.registerLazySingleton<HiveInterface>(() => registerDependencies.hive);
  g.registerLazySingleton<HiveService>(() => HiveService());
  g.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  g.registerLazySingleton<NavigationService>(
      () => registerExternalServices.navigationService);
  g.registerLazySingleton<PushNotificationService>(
      () => PushNotificationService());
  g.registerLazySingleton<SnackbarService>(
      () => registerExternalServices.snackbarService);
  g.registerLazySingleton<TimeTableService>(() => TimeTableService());
  g.registerLazySingleton<UserClubService>(
      () => registerFirestoreServices.userClubService);
  g.registerLazySingleton<UserService>(
      () => registerFirestoreServices.userService);
}

class _$RegisterFirestoreServices extends RegisterFirestoreServices {
  @override
  AnnouncementService get announcementService => AnnouncementService();
  @override
  ClubsService get clubsService => ClubsService();
  @override
  EventsService get eventsService => EventsService();
  @override
  FeedService get feedService => FeedService();
  @override
  UserClubService get userClubService => UserClubService();
  @override
  UserService get userService => UserService();
}

class _$RegisterDependencies extends RegisterDependencies {}

class _$RegisterExternalServices extends RegisterExternalServices {
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
