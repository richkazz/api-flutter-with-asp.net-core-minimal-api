import 'package:equatable/equatable.dart';

import '../../../../../core/authentication/authentication.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/login.dart';
import '../repositories/login_repositories.dart';

class PostLogin extends UseCase<AuthStatus, Params> {
  final LoginRepository repository;
  PostLogin(this.repository);
  @override
  Future<AuthStatus> call(Params params) async {
    return await repository.postLogin(params.login);
  }
}

class Params extends Equatable {
  final Login login;

  const Params({required this.login});

  @override
  List<Object?> get props => [login];
}
