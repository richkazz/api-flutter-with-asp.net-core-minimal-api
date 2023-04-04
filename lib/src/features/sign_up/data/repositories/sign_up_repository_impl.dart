import '../../../../../core/authentication/auth_exception_handler.dart';
import '../../domain/entities/sign_up.dart';
import '../../domain/repositories/sign_up_repositories.dart';
import '../data_sources/sign_up_remote_data_source.dart';

class SignUpRepositoryImpl implements SignUpRepositories {
  final SignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<AuthStatus> postSignUpData(SignUp signUp) async {
    return await remoteDataSource.postSignUpData(signUp);
  }
}
