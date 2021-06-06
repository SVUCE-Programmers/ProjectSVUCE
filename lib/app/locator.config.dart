// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i26;
import 'package:firebase_auth/firebase_auth.dart' as _i25;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i27;
import 'package:http/http.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i13;

import '../core/repositories/announcements_repository/announcements_repository.dart'
    as _i11;
import '../core/repositories/announcements_repository/announcements_repository_impl.dart'
    as _i12;
import '../core/repositories/clubs_repository/clubs_repository.dart' as _i17;
import '../core/repositories/clubs_repository/clubs_repository_impl.dart'
    as _i18;
import '../core/repositories/events_repository/events_repository.dart' as _i21;
import '../core/repositories/events_repository/events_repository_impl.dart'
    as _i22;
import '../core/repositories/feed_repository/feed_repository.dart' as _i23;
import '../core/repositories/feed_repository/feed_repository_impl.dart' as _i24;
import '../core/repositories/user_clubs_repository/user_clubs_repository.dart'
    as _i30;
import '../core/repositories/user_clubs_repository/user_clubs_repository_impl.dart'
    as _i31;
import '../core/repositories/users_repository/users_repository.dart' as _i32;
import '../core/repositories/users_repository/users_repository_impl.dart'
    as _i33;
import '../core/services/api/api_service.dart' as _i9;
import '../core/services/api/api_service_impl.dart' as _i10;
import '../core/services/auth/auth_service.dart' as _i34;
import '../core/services/auth/auth_service_impl.dart' as _i35;
import '../core/services/cloud_storage/cloud_storage_service.dart' as _i15;
import '../core/services/cloud_storage/cloud_storage_service_impl.dart' as _i16;
import '../core/services/dynamic_links/dynamic_link_impl.dart' as _i20;
import '../core/services/dynamic_links/dynamic_links.dart' as _i19;
import '../core/services/firebaseAnalyticsService.dart' as _i3;
import '../core/services/push_notifications/push_notification_service.dart'
    as _i28;
import '../core/services/push_notifications/push_notification_service_impl.dart'
    as _i29;
import '../core/services/theme_service.dart' as _i7;
import '../core/services/third_party_registrations.dart' as _i36;
import '../hive_db/services/attendance_service.dart' as _i4;
import '../hive_db/services/hive_service.dart' as _i5;
import '../hive_db/services/time_table_service.dart' as _i8;
import '../ui/screens/login/login_viewmodel.dart.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerDependencies = _$RegisterDependencies();
  gh.lazySingleton<_i3.AnalyticsService>(() => _i3.AnalyticsService());
  gh.lazySingleton<_i4.AttendanceService>(() => _i4.AttendanceService());
  gh.lazySingleton<_i5.HiveService>(() => _i5.HiveService());
  gh.lazySingleton<_i6.LoginViewModel>(() => _i6.LoginViewModel());
  gh.lazySingleton<_i7.ThemeService>(() => _i7.ThemeService());
  gh.lazySingleton<_i8.TimeTableService>(() => _i8.TimeTableService());
  gh.singleton<_i9.APIService>(_i10.APIServiceImpl());
  gh.singleton<_i11.AnnouncementsRepository>(
      _i12.AnnouncementsRepositoryImpl());
  gh.singleton<_i13.BottomSheetService>(
      registerDependencies.bottomSheetService);
  gh.singleton<_i14.Client>(registerDependencies.client);
  gh.singleton<_i15.CloudStorageService>(_i16.CloudStorageServiceImpl());
  gh.singleton<_i17.ClubsRepository>(_i18.ClubsRepositoryImpl());
  gh.singleton<_i13.DialogService>(registerDependencies.dialogService);
  gh.singleton<_i19.DynamicLinkService>(_i20.DynamicLinkServiceImpl());
  gh.singleton<_i21.EventsRepository>(_i22.EventsRepositoryImpl());
  gh.singleton<_i23.FeedRepository>(_i24.FeedRepositoryImpl());
  gh.singleton<_i25.FirebaseAuth>(registerDependencies.firebaseAuth);
  gh.singleton<_i26.FirebaseFirestore>(registerDependencies.firestore);
  gh.singleton<_i27.HiveInterface>(registerDependencies.hive);
  gh.singleton<_i13.NavigationService>(registerDependencies.navigationService);
  gh.singleton<_i28.PushNotificationService>(_i29.PushNotificationServiceImp());
  gh.singleton<_i13.SnackbarService>(registerDependencies.snackbarService);
  gh.singleton<_i30.UserClubsRepository>(_i31.UserClubsRepositoryImpl());
  gh.singleton<_i32.UsersRepository>(_i33.UsersRepositoryImpl());
  gh.singleton<_i34.AuthService>(
      _i35.AuthServiceImpl(get<_i25.FirebaseAuth>()));
  return get;
}

class _$RegisterDependencies extends _i36.RegisterDependencies {}
