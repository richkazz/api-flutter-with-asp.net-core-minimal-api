import 'dart:developer';

/// App level configuration variables
class Configs {
  /// The max allowed age duration for the http cache
  static const Duration maxCacheAge = Duration(hours: 1);

  /// Key used in dio options to indicate whether
  /// cache should be force refreshed
  static const String dioCacheForceRefreshKey = 'dio_cache_force_refresh_key';

  /// Base API URL of The TMDB API
  ///
  /// See: https://developers.themoviedb.org/3/getting-started/introduction
  static const String apiBaseUrl = "https://localhost:7296/api";

  /// API Key registered with The TMDB API
  ///
  /// See: https://developers.themoviedb.org/3/getting-started/introduction
  static const String tmdbAPIKey = String.fromEnvironment('TMDB_API_KEY');

  static const String subjectEndPoint = "/subjects";
  static const String activeSchoolTermEndPoint = "/active-school-term";
  static const String adminsettingsEndPoint = "/adminsettings";

  ///Log error message in style
  static void errorLogger(String message,
      {required String methodName,
      required String className,
      required String exceptionName}) {
    log('----------------------------');
    log('❌ ❌ ❌ class: $className');
    log('❌ ❌ ❌ method: $methodName');
    log('❌ ❌ ❌ exception: $exceptionName');
    log('❌ ❌ ❌ message: $message');
    log('----------------------------');
  }
}
