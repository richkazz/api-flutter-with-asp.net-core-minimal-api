import '../../../../../core/authentication/authentication.dart';
import '../entities/login.dart';

abstract class LoginRepository {
  Future<AuthStatus> postLogin(Login login);
}
