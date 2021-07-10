// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i27;
import 'package:firebase_auth/firebase_auth.dart' as _i26;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i28;
import 'package:http/http.dart' as _i15;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i14;
import 'package:svuce_app/core/services/connectivity%20service/connectivity_services.dart';
import 'package:svuce_app/core/services/excel%20service/excel_service.dart';
import 'package:svuce_app/core/services/excel%20service/excel_service_impl.dart';
import 'package:svuce_app/core/services/share%20service/share_service.dart';
import 'package:svuce_app/core/services/share%20service/share_service_impl.dart';
import 'package:svuce_app/core/services/staff%20service/staff_service.dart';
import 'package:svuce_app/core/services/staff%20service/staff_service_impl.dart';
import 'package:svuce_app/core/services/student%20services/student_service.dart';
import 'package:svuce_app/core/services/student%20services/student_service_impl.dart';

import '../core/repositories/clubs_repository/clubs_repository.dart' as _i18;
import '../core/repositories/clubs_repository/clubs_repository_impl.dart'
    as _i19;
import '../core/repositories/events_repository/events_repository.dart' as _i22;
import '../core/repositories/events_repository/events_repository_impl.dart'
    as _i23;
import '../core/repositories/feed_repository/feed_repository.dart' as _i24;
import '../core/repositories/feed_repository/feed_repository_impl.dart' as _i25;
import '../core/repositories/user_clubs_repository/user_clubs_repository.dart'
    as _i31;
import '../core/repositories/user_clubs_repository/user_clubs_repository_impl.dart'
    as _i32;
import '../core/repositories/users_repository/users_repository.dart' as _i33;
import '../core/repositories/users_repository/users_repository_impl.dart'
    as _i34;
import '../core/services/api/api_service.dart' as _i8;
import '../core/services/api/api_service_impl.dart' as _i9;
import '../core/services/auth/auth_service.dart' as _i12;
import '../core/services/auth/auth_service_impl.dart' as _i13;
import '../core/services/cloud_storage/cloud_storage_service.dart' as _i16;
import '../core/services/cloud_storage/cloud_storage_service_impl.dart' as _i17;
import '../core/services/dynamic_links/dynamic_link_impl.dart' as _i21;
import '../core/services/dynamic_links/dynamic_links.dart' as _i20;
import '../core/services/firebaseAnalyticsService.dart' as _i3;
import '../core/services/push_notifications/push_notification_service.dart'
    as _i29;
import '../core/services/push_notifications/push_notification_service_impl.dart'
    as _i30;
import '../core/services/theme_service.dart' as _i6;
import '../core/services/third_party_registrations.dart' as _i35;
import '../hive_db/services/attendance_service.dart' as _i4;
import '../hive_db/services/hive_service.dart' as _i5;
import '../hive_db/services/time_table_service.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerDependencies = _$RegisterDependencies();
  gh.singleton<_i14.SnackbarService>(registerDependencies.snackbarService);

  gh.singleton<_i14.BottomSheetService>(
      registerDependencies.bottomSheetService);
  gh.lazySingleton<ConnectivityServices>(() => ConnectivityServices());
  gh.lazySingleton<_i3.AnalyticsService>(() => _i3.AnalyticsService());
  gh.singleton<_i14.NavigationService>(registerDependencies.navigationService);
  gh.singleton<_i26.FirebaseAuth>(registerDependencies.firebaseAuth);
  gh.singleton<_i27.FirebaseFirestore>(registerDependencies.firestore);
  gh.singleton<_i28.HiveInterface>(registerDependencies.hive);
  gh.singleton<_i33.UsersRepository>(_i34.UsersRepositoryImpl());
  gh.lazySingleton<_i6.ThemeService>(() => _i6.ThemeService());
  gh.singleton<_i15.Client>(registerDependencies.client);
  gh.singleton<_i12.AuthService>(_i13.AuthServiceImpl());
  gh.singleton<_i29.PushNotificationService>(_i30.PushNotificationServiceImp());
  gh.lazySingleton<_i4.AttendanceService>(() => _i4.AttendanceService());
  gh.singleton<ExcelService>(ExcelServiceImpl());
  gh.singleton<StudentService>(StudentServiceImpl());
  gh.lazySingleton<_i5.HiveService>(() => _i5.HiveService());
  gh.singleton<StaffService>(StaffServiceImpl());
  gh.singleton<ShareService>(ShareServiceImpl());
  gh.lazySingleton<_i7.TimeTableService>(() => _i7.TimeTableService());
  gh.singleton<_i8.APIService>(_i9.APIServiceImpl());
  gh.singleton<_i16.CloudStorageService>(_i17.CloudStorageServiceImpl());
  gh.singleton<_i18.ClubsRepository>(_i19.ClubsRepositoryImpl());
  gh.singleton<_i14.DialogService>(registerDependencies.dialogService);
  gh.singleton<_i20.DynamicLinkService>(_i21.DynamicLinkServiceImpl());
  gh.singleton<_i22.EventsRepository>(_i23.EventsRepositoryImpl());
  gh.singleton<_i24.FeedRepository>(_i25.FeedRepositoryImpl());
  gh.singleton<_i31.UserClubsRepository>(_i32.UserClubsRepositoryImpl());
  return get;
}

class _$RegisterDependencies extends _i35.RegisterDependencies {}
