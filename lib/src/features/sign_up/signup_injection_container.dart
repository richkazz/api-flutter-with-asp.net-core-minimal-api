import 'package:api_tempate_flutter/src/features/sign_up/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/data_sources/sign_up_remote_data_source.dart';
import 'data/repositories/sign_up_repository_impl.dart';
import 'domain/repositories/sign_up_repositories.dart';
import 'domain/usecases/post_sign_up_data.dart';

final sl = GetIt.instance;

void init() {
  //! Features - Number Trivia

  //! Bloc
  sl.registerFactory(
    () => SignUpBloc(
      signUpData: sl(),
    ),
  );
// Use cases
  sl.registerLazySingleton(() => PostSignUpData(sl()));

// Repository
  sl.registerLazySingleton<SignUpRepositories>(
    () => SignUpRepositoryImpl(remoteDataSource: sl()),
  );
  //! External

  // Data sources
  sl.registerLazySingleton<SignUpRemoteDataSource>(
    () => SignUpRemoteDataSourceImpl(client: sl(), auth: sl()),
  );
}
