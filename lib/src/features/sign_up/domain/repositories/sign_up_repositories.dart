import '../../../../../core/authentication/auth_exception_handler.dart';
import '../entities/sign_up.dart';

abstract class SignUpRepositories {
  Future<AuthStatus> postSignUpData(SignUp signUp);
}
