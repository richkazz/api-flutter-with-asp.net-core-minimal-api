import 'package:api_tempate_flutter/src/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/login_remote_data_source.dart';
import 'data/repository/login_repository.dart';
import 'domain/repositories/login_repositories.dart';
import 'domain/usecases/post_login.dart';

final sl = GetIt.instance;

void init() {
  //! Features - Number Trivia
//! Bloc
  sl.registerFactory(
    () => LoginBloc(
      login: sl(),
    ),
  );

// Use cases
  sl.registerLazySingleton(() => PostLogin(sl()));

// Repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(remoteDataSource: sl()),
  );
  //! External

  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(client: sl(), auth: sl()),
  );
}
