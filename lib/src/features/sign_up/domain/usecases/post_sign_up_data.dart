import 'package:equatable/equatable.dart';

import '../../../../../core/authentication/auth_exception_handler.dart';
import '../../../../../core/use_cases/use_case.dart';
import '../entities/sign_up.dart';
import '../repositories/sign_up_repositories.dart';

class PostSignUpData extends UseCase<AuthStatus, Params> {
  final SignUpRepositories repository;
  PostSignUpData(this.repository);
  @override
  Future<AuthStatus> call(Params params) async {
    return await repository.postSignUpData(params.signUp);
  }
}

class Params extends Equatable {
  final SignUp signUp;

  const Params({required this.signUp});

  @override
  List<Object?> get props => [signUp];
}
