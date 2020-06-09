// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:svuce_app/core/repositories/register_firestore_services.dart';
import 'package:svuce_app/core/services/api/api_service_impl.dart';
import 'package:svuce_app/core/services/api/api_service.dart';
import 'package:svuce_app/core/repositories/announcement_repository/announcement_repository_impl.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';
import 'package:svuce_app/core/services/register_dependencies.dart';
import 'package:svuce_app/core/services/cloud_storage/cloud_storage_service_impl.dart';
import 'package:svuce_app/core/services/cloud_storage/cloud_storage_service.dart';
import 'package:svuce_app/core/repositories/clubs_service.dart';
import 'package:svuce_app/core/repositories/event_service.dart';
import 'package:svuce_app/core/repositories/feed_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/ui/screens/login/login_viewmodel.dart.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/core/services/push_notifications/push_notification_service_impl.dart';
import 'package:svuce_app/core/services/push_notifications/push_notification_service.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/core/repositories/user_club_service.dart';
import 'package:svuce_app/core/repositories/user_service.dart';
import 'package:svuce_app/core/services/auth/auth_service_impl.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerFirestoreServices = _$RegisterFirestoreServices();
  final registerDependencies = _$RegisterDependencies();
  g.registerLazySingleton<AnnouncementRepositoryImpl>(
      () => registerFirestoreServices.announcementService);
  g.registerLazySingleton<AttendanceService>(() => AttendanceService());
  g.registerLazySingleton<ClubsService>(
      () => registerFirestoreServices.clubsService);
  g.registerLazySingleton<EventsService>(
      () => registerFirestoreServices.eventsService);
  g.registerLazySingleton<FeedService>(
      () => registerFirestoreServices.feedService);
  g.registerLazySingleton<HiveService>(() => HiveService());
  g.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  g.registerLazySingleton<NavigationService>(
      () => registerDependencies.navigationService);
  g.registerLazySingleton<SnackbarService>(
      () => registerDependencies.snackbarService);
  g.registerLazySingleton<TimeTableService>(() => TimeTableService());
  g.registerLazySingleton<UserClubService>(
      () => registerFirestoreServices.userClubService);
  g.registerLazySingleton<UserService>(
      () => registerFirestoreServices.userService);

  //Eager singletons must be registered in the right order
  g.registerSingleton<APIService>(APIServiceImpl());
  g.registerSingleton<Client>(registerDependencies.client);
  g.registerSingleton<CloudStorageService>(CloudStorageServiceImpl());
  g.registerSingleton<FirebaseAuth>(registerDependencies.firebaseAuth);
  g.registerSingleton<Firestore>(registerDependencies.firestore);
  g.registerSingleton<HiveInterface>(registerDependencies.hive);
  g.registerSingleton<PushNotificationService>(PushNotificationServiceImp());
  g.registerSingleton<AuthService>(AuthServiceImpl(g<FirebaseAuth>()));
}

class _$RegisterFirestoreServices extends RegisterRepos {
  @override
  AnnouncementRepositoryImpl get announcementService => AnnouncementRepositoryImpl();
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

class _$RegisterDependencies extends RegisterDependencies {
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
