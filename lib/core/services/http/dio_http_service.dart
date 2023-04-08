import 'package:api_tempate_flutter/core/configs/configs.dart';
import 'package:api_tempate_flutter/core/exceptions/http_exception.dart';
import 'package:api_tempate_flutter/core/services/http/dio-interceptors/cache_interceptor.dart';
import 'package:api_tempate_flutter/core/services/storage/storage_service.dart';
import 'package:dio/dio.dart';
import 'http_service.dart';

/// Http service implementation using the Dio package
///
/// See https://pub.dev/packages/dio
class DioHttpService implements HttpService {
  /// Creates new instance of [DioHttpService]
  DioHttpService(this.storageService,
      {Dio? dioOverride, bool enableCaching = true, String? token}) {
    addTokenToHeaderIfAvaibale(token);
    dio = dioOverride ?? Dio(baseOptions);
    if (enableCaching) {
      dio.interceptors.add(CacheInterceptor(storageService));
    }
  }

  void addTokenToHeaderIfAvaibale(String? token) {
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
  }

  /// Storage service used for caching http responses
  final StorageService storageService;

  /// The Dio Http client
  late final Dio dio;

  /// The Dio base options
  BaseOptions get baseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );

  @override
  String get baseUrl => Configs.apiBaseUrl;

  @override
  Map<String, String> headers = {'content-type': 'application/json'};

  @override
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
    String? customBaseUrl,
  }) async {
    //dio.options.extra[Configs.dioCacheForceRefreshKey] = forceRefresh;

    final Response<dynamic> response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
    );
    if (response.data == null || response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future<dynamic> post(
    String endpoint, {
    Object? data,
  }) async {
    final Response<dynamic> response = await dio.post(
      endpoint,
      data: data,
    );

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }

  @override
  Future<dynamic> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<dynamic> put(
    String endpoint, {
    Object? data,
  }) async {
    final Response<dynamic> response = await dio.put(endpoint, data: data);

    if (response.statusCode != 204 && response.statusCode != 200) {
      throw HttpException(
        title: 'Http Error!',
        statusCode: response.statusCode,
        message: response.statusMessage,
      );
    }

    return response.data;
  }
}
