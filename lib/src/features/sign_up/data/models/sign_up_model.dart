import '../../domain/entities/sign_up.dart';

class SignUpModel extends SignUp {
  const SignUpModel(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword})
      : super(
            name: name,
            email: email,
            password: password,
            confirmPassword: confirmPassword);

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['confirmPassword'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'userName': name,
      'password': password,
    };
  }
}
