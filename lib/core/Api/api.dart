class Api {
  static get apiLink => "https://localhost:7296/api";
  static String token = '';
  static Map<String, String> headers = {'Content-Type': 'application/json'};
  static void addTokenToHeader() =>
      headers.addAll({'Authorization': 'Bearer $token'});
  static const String subjectEndPoint = "/subjects";
  static const String activeSchoolTermEndPoint = "/active-school-term";
  static const String adminsettingsEndPoint = "/adminsettings";
}
