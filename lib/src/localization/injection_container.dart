import 'package:api_tempate_flutter/core/authentication/authentication.dart';
import 'package:api_tempate_flutter/core/services/http/dio-interceptors/cache_interceptor.dart';
import 'package:api_tempate_flutter/core/services/http/dio_http_service.dart';
import 'package:api_tempate_flutter/core/services/http/http_service.dart';
import 'package:api_tempate_flutter/core/services/storage/hive_storage_service.dart';
import 'package:api_tempate_flutter/core/services/storage/storage_service.dart';
import 'package:api_tempate_flutter/util/input_validation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:api_tempate_flutter/src/features/login/login_injection_container.dart'
    as login;
import 'package:api_tempate_flutter/src/features/sign_up/signup_injection_container.dart'
    as signup;
import 'package:api_tempate_flutter/src/features/admin/admin_injection_container.dart'
    as admin;

import '../../core/Api/api.dart';

final sl = GetIt.instance;

void init() {
  login.init();
  signup.init();
  admin.init();
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(
      () => Dio(BaseOptions(baseUrl: Api.apiLink, headers: Api.headers)));

  sl.registerLazySingleton(() => InputValidator());

  sl.registerLazySingleton<AuthenticationHelperInterface>(
    () => AuthenticationHelperService(dioClient: sl()),
  );
  HiveStorageService hiveStorageService = HiveStorageService();
  hiveStorageService.init();
  sl.registerLazySingleton<HttpService>(
      () => DioHttpService(hiveStorageService));
  sl.registerLazySingleton<StorageService>(
    () => HiveStorageService(),
  );
  sl.registerLazySingleton(() => HiveStorageService().init());

  sl.registerLazySingleton<Interceptor>(
    () => CacheInterceptor(hiveStorageService),
  );
}
