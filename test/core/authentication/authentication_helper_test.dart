import 'dart:convert';
import 'package:api_tempate_flutter/core/Api/api.dart';
import 'package:api_tempate_flutter/core/authentication/authentication.dart';
import 'package:api_tempate_flutter/core/error/exception.dart';
import 'package:api_tempate_flutter/src/features/login/domain/entities/login.dart';
import 'package:api_tempate_flutter/src/features/sign_up/data/models/sign_up_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late AuthenticationHelperInterface authenticationHelper;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    mockDioClient.options =
        BaseOptions(baseUrl: Api.apiLink, headers: Api.headers);
    authenticationHelper =
        AuthenticationHelperService(dioClient: mockDioClient);
  });

  group('signIn', () {
    final login = Login(email: 'test@example.com', password: 'password');

    test('returns successful when status code is 200', () async {
      mockDioClient = MockDioClient();
      mockDioClient.options =
          BaseOptions(baseUrl: Api.apiLink, headers: Api.headers);
      authenticationHelper =
          AuthenticationHelperService(dioClient: mockDioClient);
      const token = 'abc123';
      final response = Response(
          data: token,
          statusCode: 200,
          requestOptions:
              RequestOptions(baseUrl: Api.apiLink, headers: Api.headers));

      try {
        when(mockDioClient.post('/auth/login',
                data: json.encode(login.toJson())))
            .thenAnswer((_) async => response);

        final result = await authenticationHelper.signIn(login);

        expect(result, equals(AuthStatus.successful));
      } on Exception catch (e) {
        print(e);
      }
    });

    test('throws ServerException when status code is not 200', () async {
      final response = Response(
          data: null,
          statusCode: 500,
          requestOptions: RequestOptions(baseUrl: Api.apiLink));
      when(mockDioClient.post('/auth/login', data: json.encode(login.toJson())))
          .thenAnswer((_) async => response);

      expect(() => authenticationHelper.signIn(login),
          throwsA(isInstanceOf<ServerException>()));
    });
  });

  group('signUp', () {
    const signUp = SignUpModel(
        name: 'Test User',
        email: 'test@example.com',
        password: 'password',
        confirmPassword: "");

    test('returns successful when status code is 200', () async {
      final response = Response(
          data: null,
          statusCode: 200,
          requestOptions: RequestOptions(baseUrl: Api.apiLink));
      when(mockDioClient.post('/auth/register',
              data: json.encode(signUp.toJson())))
          .thenAnswer((_) async => response);

      final result = await authenticationHelper.signUp(signUp);

      expect(result, equals(AuthStatus.successful));
    });

    test('throws ServerException when status code is not 200', () async {
      final response = Response(
          data: null,
          statusCode: 500,
          requestOptions: RequestOptions(baseUrl: Api.apiLink));
      when(mockDioClient.post('/auth/register',
              data: json.encode(signUp.toJson())))
          .thenAnswer((_) async => response);

      expect(() => authenticationHelper.signUp(signUp),
          throwsA(isInstanceOf<ServerException>()));
    });
  });
}
