import 'package:api_tempate_flutter/core/authentication/authentication.dart';
import 'package:api_tempate_flutter/util/input_validation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:api_tempate_flutter/src/features/login/login_injection_container.dart'
    as login;
import 'package:api_tempate_flutter/src/features/sign_up/signup_injection_container.dart'
    as signup;

import '../../core/Api/api.dart';

final sl = GetIt.instance;

void init() {
  login.init();
  signup.init();

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: Api.apiLink, headers: Api.headers)));

  sl.registerLazySingleton(() => InputValidator());

  sl.registerLazySingleton<AuthenticationHelperInterface>(
    () => AuthenticationHelperService(dioClient: sl()),
  );
}
