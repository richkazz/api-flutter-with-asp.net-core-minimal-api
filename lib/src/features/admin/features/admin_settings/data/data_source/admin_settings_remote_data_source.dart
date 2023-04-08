import 'dart:convert';

import 'package:api_tempate_flutter/core/Api/api.dart';
import 'package:api_tempate_flutter/core/services/http/http_service.dart';
import 'package:dio/dio.dart';

import '../../../../../../../core/error/error.dart';
import '../models/models.dart';

abstract class AdminSettingsRemoteDataSource {
  /// TMDB Base endpoint path for people requests
  ///
  /// See:
  String get path;

  /// API Token used to authenticate requests
  ///
  /// See:
  String get token;

  /// Throws a [ServerException] for all error codes.
  Future<ActiveSchoolTerm> getActiveTerm();
  Future<List<Subject>> getAllSchoolSubjects();
  Future updateActiveTerm(ActiveSchoolTerm activeSchoolTerm);
  Future<AdminSetting> getAdminSetting();
  Future createAdminSetting(AdminSetting adminSetting);
  Future updateAdminSetting(AdminSetting adminSetting);
}

class AdminSettingsDataSourceImpl implements AdminSettingsRemoteDataSource {
  final Dio dioClient;

  /// Http service used to access an Http client and make calls
  final HttpService httpService;
  AdminSettingsDataSourceImpl(
      {required this.dioClient, required this.httpService});
  @override
  String get path => Api.activeSchoolTermEndPoint;

  @override
  String get token => Api.token;

  @override
  Future<ActiveSchoolTerm> getActiveTerm() async {
    final response = await httpService.get(path);
    var map = response as Map<String, dynamic>;
    return ActiveSchoolTerm.fromJson(map);
  }

  @override
  Future<List<Subject>> getAllSchoolSubjects() async {
    final response = await httpService.get(Api.subjectEndPoint);
    var map = response as List<dynamic>;
    var list = map.map((element) {
      return Subject.fromJson(element);
    }).toList();
    return list;
  }

  @override
  Future updateActiveTerm(ActiveSchoolTerm activeSchoolTerm) async {
    var body = json.encode(activeSchoolTerm.toJson());
    await httpService.put(Api.activeSchoolTermEndPoint, data: body);
  }

  @override
  Future createAdminSetting(AdminSetting adminSetting) async {
    var body = json.encode(adminSetting.toJson());
    final response =
        await httpService.post(Api.adminsettingsEndPoint, data: body);
  }

  @override
  Future<AdminSetting> getAdminSetting() async {
    final response = await httpService.get(Api.adminsettingsEndPoint);
    var map = response as Map<String, dynamic>;
    return AdminSetting.fromJson(map);
  }

  @override
  Future updateAdminSetting(AdminSetting adminSetting) async {
    var body = json.encode(adminSetting.toJson());
    final response = await dioClient.put(Api.adminsettingsEndPoint, data: body);
    if (response.statusCode == 204) {
      return;
    } else {
      throw ServerException();
    }
  }
}
