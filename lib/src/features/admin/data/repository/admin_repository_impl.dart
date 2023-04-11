import 'package:api_tempate_flutter/src/features/admin/data/data_source/admin_remote_data_source.dart';
import 'package:api_tempate_flutter/src/features/admin/domain/repositories/admin_repositories.dart';
import 'package:api_tempate_flutter/src/models/models.dart';

class AdminRepositoryImpl implements AdminRepositories {
  final AdminRemoteDataSource remoteDataSource;

  AdminRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ActiveSchoolTerm> getActiveTerm() async {
    return await remoteDataSource.getActiveTerm();
  }

  @override
  Future updateActiveTerm(ActiveSchoolTerm activeSchoolTerm) async {
    return await remoteDataSource.updateActiveTerm(activeSchoolTerm);
  }

  @override
  Future<List<Subject>> getAllSchoolSubjects() async {
    return await remoteDataSource.getAllSchoolSubjects();
  }

  @override
  Future createAdminSetting(AdminSetting adminSetting) async {
    return await remoteDataSource.createAdminSetting(adminSetting);
  }

  @override
  Future<AdminSetting> getAdminSetting() async {
    return await remoteDataSource.getAdminSetting();
  }

  @override
  Future updateAdminSetting(AdminSetting adminSetting) async {
    return await remoteDataSource.updateAdminSetting(adminSetting);
  }
}
