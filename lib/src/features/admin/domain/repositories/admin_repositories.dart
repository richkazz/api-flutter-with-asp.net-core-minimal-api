import 'package:api_tempate_flutter/src/models/models.dart';

abstract class AdminRepositories {
  Future<ActiveSchoolTerm> getActiveTerm();
  Future<AdminSetting> getAdminSetting();
  Future createAdminSetting(AdminSetting adminSetting);
  Future<List<Subject>> getAllSchoolSubjects();
  Future updateAdminSetting(AdminSetting adminSetting);
  Future updateActiveTerm(ActiveSchoolTerm activeSchoolTerm);
}
