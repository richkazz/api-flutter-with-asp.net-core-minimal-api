import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/authentication/authentication.dart';
import '../../domain/entities/login.dart';

abstract class LoginRemoteDataSource {
  /// Calls the login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AuthStatus> postLogin(Login login);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client client;
  final AuthenticationHelperInterface auth;
  LoginRemoteDataSourceImpl({required this.client, required this.auth});

  @override
  Future<AuthStatus> postLogin(Login login) async {
    return auth.signIn(login);
  }
}
