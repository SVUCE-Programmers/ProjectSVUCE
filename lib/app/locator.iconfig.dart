// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:svuce_app/core/services/api/api_service_impl.dart';
import 'package:svuce_app/core/services/api/api_service.dart';
import 'package:svuce_app/core/repositories/announcements_repository/announcements_repository_impl.dart';
import 'package:svuce_app/core/repositories/announcements_repository/announcements_repository.dart';
import 'package:svuce_app/hive_db/services/attendance_service.dart';
import 'package:svuce_app/core/services/register_dependencies.dart';
import 'package:svuce_app/core/services/cloud_storage/cloud_storage_service_impl.dart';
import 'package:svuce_app/core/services/cloud_storage/cloud_storage_service.dart';
import 'package:svuce_app/core/repositories/clubs_repository/clubs_repository_impl.dart';
import 'package:svuce_app/core/repositories/clubs_repository/clubs_repository.dart';
import 'package:svuce_app/core/services/dynamic_links/dynamic_link_impl.dart';
import 'package:svuce_app/core/services/dynamic_links/dynamic_links.dart';
import 'package:svuce_app/core/repositories/events_repository/events_repository_impl.dart';
import 'package:svuce_app/core/repositories/events_repository/events_repository.dart';
import 'package:svuce_app/core/repositories/feed_repository/feed_repository_impl.dart';
import 'package:svuce_app/core/repositories/feed_repository/feed_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:svuce_app/hive_db/services/hive_service.dart';
import 'package:svuce_app/ui/screens/login/login_viewmodel.dart.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/core/services/push_notifications/push_notification_service_impl.dart';
import 'package:svuce_app/core/services/push_notifications/push_notification_service.dart';
import 'package:svuce_app/hive_db/services/time_table_service.dart';
import 'package:svuce_app/core/repositories/user_clubs_repository/user_clubs_repository_impl.dart';
import 'package:svuce_app/core/repositories/user_clubs_repository/user_clubs_repository.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository_impl.dart';
import 'package:svuce_app/core/repositories/users_repository/users_repository.dart';
import 'package:svuce_app/core/services/auth/auth_service_impl.dart';
import 'package:svuce_app/core/services/auth/auth_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerDependencies = _$RegisterDependencies();
  g.registerSingleton<Firestore>(registerDependencies.firestore);

  g.registerLazySingleton<AttendanceService>(() => AttendanceService());
  g.registerLazySingleton<HiveService>(() => HiveService());
  g.registerLazySingleton<LoginViewModel>(() => LoginViewModel());
  g.registerLazySingleton<NavigationService>(
      () => registerDependencies.navigationService);
  g.registerLazySingleton<SnackbarService>(
      () => registerDependencies.snackbarService);
  g.registerLazySingleton<TimeTableService>(() => TimeTableService());

  //Eager singletons must be registered in the right order
  g.registerSingleton<APIService>(APIServiceImpl());
  g.registerSingleton<AnnouncementsRepository>(AnnouncementsRepositoryImpl());
  g.registerSingleton<Client>(registerDependencies.client);
  g.registerSingleton<CloudStorageService>(CloudStorageServiceImpl());
  g.registerSingleton<ClubsRepository>(ClubsRepositoryImpl());
  g.registerSingleton<DynamicLinkService>(DynamicLinkServiceImpl());
  g.registerSingleton<EventsRepository>(EventsRepositoryImpl());
  g.registerSingleton<FeedRepository>(FeedRepositoryImpl());
  g.registerSingleton<FirebaseAuth>(registerDependencies.firebaseAuth);
  g.registerSingleton<HiveInterface>(registerDependencies.hive);
  g.registerSingleton<PushNotificationService>(PushNotificationServiceImp());
  g.registerSingleton<UserClubsRepository>(UserClubsRepositoryImpl());
  g.registerSingleton<UsersRepository>(UsersRepositoryImpl());
  g.registerSingleton<AuthService>(AuthServiceImpl(g<FirebaseAuth>()));
}

class _$RegisterDependencies extends RegisterDependencies {
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
