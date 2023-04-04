import '../../../../../core/authentication/authentication.dart';
import '../../domain/entities/login.dart';
import '../../domain/repositories/login_repositories.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<AuthStatus> postLogin(Login login) async {
    return await remoteDataSource.postLogin(login);
  }
}
