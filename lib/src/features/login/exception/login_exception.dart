class LoginException implements Exception {
  LoginException([var message]);
}

class LoginError {
  final String error;

  LoginError({
    required this.error,
  });

  factory LoginError.fromJson(Map<String, dynamic> json) {
    return LoginError(
      error: json['error'] as String,
    );
  }
}
