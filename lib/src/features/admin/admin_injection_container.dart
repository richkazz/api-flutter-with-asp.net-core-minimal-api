import 'package:api_tempate_flutter/src/features/admin/data/data_source/admin_remote_data_source.dart';
import 'package:api_tempate_flutter/src/features/admin/data/repository/admin_repository_impl.dart';
import 'package:api_tempate_flutter/src/features/admin/domain/repositories/admin_repositories.dart';
import 'package:api_tempate_flutter/src/features/admin/domain/usecases/admin_usecases.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/presentation/bloc/bloc/account_bloc.dart';
import 'package:api_tempate_flutter/src/features/admin/presentation/bloc/bloc/admin_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/admin_settings/presentation/bloc/admin_settings_bloc.dart';

final sl = GetIt.instance;

void init() {
  //! Features - Number Trivia
//! Bloc
  sl.registerFactory(
    () => AdminBloc(),
  );
  sl.registerFactory(
    () => AccountBloc(getAllSchoolSubject: sl()),
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
  sl.registerLazySingleton<AdminRepositories>(
    () => AdminRepositoryImpl(remoteDataSource: sl()),
  );
  //! External

  // Data sources
  sl.registerLazySingleton<AdminRemoteDataSource>(
    () => AdminDataSourceImpl(httpService: sl()),
  );
}
