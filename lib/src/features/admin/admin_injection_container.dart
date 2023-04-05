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
    () => AdminSettingsBloc(getActibeTerm: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetActiveTerm(sl()));

// Repository
  sl.registerLazySingleton<AdminSettingsRepositories>(
    () => AdminSettingsRepositoryImpl(remoteDataSource: sl()),
  );
  //! External

  // Data sources
  sl.registerLazySingleton<AdminSettingsRemoteDataSource>(
    () => AdminSettingsDataSourceImpl(dioClient: sl()),
  );
}
