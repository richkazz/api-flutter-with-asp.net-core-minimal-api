class SignupErrorModel {
  final List<String> errors;

  SignupErrorModel({
    required this.errors,
  });

  factory SignupErrorModel.fromJson(Map<String, dynamic> json) {
    final errorsJson = json['errors'] as List<dynamic>;
    final errorsList = List<String>.from(errorsJson.map((e) => e as String));

    return SignupErrorModel(errors: errorsList);
  }
}
