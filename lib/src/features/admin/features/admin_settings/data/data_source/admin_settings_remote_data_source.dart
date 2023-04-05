import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../../../core/error/error.dart';
import '../models/active_school_term.dart';

abstract class AdminSettingsRemoteDataSource {
  /// Throws a [ServerException] for all error codes.
  Future<ActiveSchoolTerm> getActiveTerm();
  Future updateActiveTerm(ActiveSchoolTerm activeSchoolTerm);
}

class AdminSettingsDataSourceImpl implements AdminSettingsRemoteDataSource {
  final Dio dioClient;
  AdminSettingsDataSourceImpl({required this.dioClient});

  @override
  Future<ActiveSchoolTerm> getActiveTerm() async {
    final response = await dioClient.get('/active-school-term');
    if (response.statusCode == 200) {
      var map = response.data as Map<String, dynamic>;
      return ActiveSchoolTerm.fromJson(map);
    } else {
      throw ServerException();
    }
  }

  @override
  Future updateActiveTerm(ActiveSchoolTerm activeSchoolTerm) async {
    var body = json.encode(activeSchoolTerm.toJson());
    final response = await dioClient.put('/active-school-term', data: body);
    if (response.statusCode == 204) {
      return;
    } else {
      throw ServerException();
    }
  }
}
