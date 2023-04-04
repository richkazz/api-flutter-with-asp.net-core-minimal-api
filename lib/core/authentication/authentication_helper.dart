import 'dart:convert';

import 'package:api_tempate_flutter/core/error/error.dart';
import 'package:dio/dio.dart';

import '../../src/features/login/domain/entities/login.dart';
import '../../src/features/sign_up/data/models/sign_up_model.dart';
import '../Api/api.dart';
import 'auth_exception_handler.dart';

abstract class AuthenticationHelperInterface {
  /// Calls the login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<AuthStatus> signIn(Login login);
  Future<AuthStatus> signUp(SignUpModel signUp);
}

class AuthenticationHelperService implements AuthenticationHelperInterface {
  final Dio dioClient;
  AuthenticationHelperService({required this.dioClient});

  @override
  Future<AuthStatus> signIn(Login login) async {
    var body = json.encode(login.toJson());
    final response = await dioClient.post('/auth/login', data: body);
    if (response.statusCode == 200) {
      Api.token = response.data;
      return AuthStatus.successful;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthStatus> signUp(SignUpModel signUp) async {
    var body = json.encode(signUp.toJson());
    final response = await dioClient.post('/auth/register', data: body);
    if (response.statusCode == 200) {
      return AuthStatus.successful;
    } else {
      throw ServerException();
    }
  }
}
