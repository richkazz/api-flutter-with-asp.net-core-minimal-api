import 'package:http/http.dart' as http;
import '../../../../../core/authentication/authentication.dart';
import '../../../../../core/error/error.dart';
import '../../domain/entities/sign_up.dart';
import '../models/sign_up_model.dart';

abstract class SignUpRemoteDataSource {
  ///  Signup the user.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AuthStatus> postSignUpData(SignUp signUp);
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final http.Client client;
  final AuthenticationHelperInterface auth;
  SignUpRemoteDataSourceImpl({required this.client, required this.auth});

  @override
  Future<AuthStatus> postSignUpData(SignUp signUp) async {
    return await auth.signUp(SignUpModel(
        confirmPassword: signUp.confirmPassword,
        email: signUp.email,
        name: signUp.name,
        password: signUp.password));
  }
}
