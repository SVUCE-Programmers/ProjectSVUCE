// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';
import 'package:svuce_app/services/register_services.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final registerExternalServices = _$RegisterExternalServices();
  g.registerLazySingleton<NavigationService>(
      () => registerExternalServices.navigationService);
  g.registerLazySingleton<SnackbarService>(
      () => registerExternalServices.snackbarService);
}

class _$RegisterExternalServices extends RegisterExternalServices {
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
