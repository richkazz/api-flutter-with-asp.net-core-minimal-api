import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/domain/usecases/admin_setting_get_admin_setting.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/domain/usecases/admin_setting_update_admin_setting.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/domain/usecases/admin_settings_create_admin_settings.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/domain/usecases/admin_settings_get_all_subjects.dart';
import 'package:api_tempate_flutter/src/features/admin/presentation/bloc/bloc/admin_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/admin_settings/admin_settings.dart';
import 'features/admin_settings/presentation/bloc/admin_settings_bloc.dart';

final sl = GetIt.instance;

void init() {
  //! Features - Number Trivia
//! Bloc
  sl.registerFactory(
    () => AdminBloc(),
  );
  sl.registerFactory(
    () => AdminSettingsBloc(
        getActibeTerm: sl(),
        updateActibeTerm: sl(),
        getAllSchoolSubject: sl(),
        getAdminSetting: sl(),
        updateAdminSetting: sl(),
        createAdminSetting: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetActiveTerm(sl()));
  sl.registerLazySingleton(() => UpdateActiveTerm(sl()));
  sl.registerLazySingleton(() => GetAllSchoolSubject(sl()));
  sl.registerLazySingleton(() => GetAdminSetting(sl()));
  sl.registerLazySingleton(() => UpdateAdminSetting(sl()));
  sl.registerLazySingleton(() => CreateAdminSetting(sl()));

// Repository
  sl.registerLazySingleton<AdminSettingsRepositories>(
    () => AdminSettingsRepositoryImpl(remoteDataSource: sl()),
  );
  //! External

  // Data sources
  sl.registerLazySingleton<AdminSettingsRemoteDataSource>(
    () => AdminSettingsDataSourceImpl(dioClient: sl(), httpService: sl()),
  );
}
