/// Http Service Interface
abstract class HttpService {
  /// Http base url
  String get baseUrl;

  /// Http headers
  Map<String, String> get headers;

  /// Http get request
  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    bool forceRefresh = false,
  });

  /// Http post request
  Future<dynamic> post(
    String endpoint, {
    Object? data,
  });

  /// Http put request
  Future<dynamic> put(
    String endpoint, {
    Object? data,
  });

  /// Http delete request
  Future<dynamic> delete();
}
