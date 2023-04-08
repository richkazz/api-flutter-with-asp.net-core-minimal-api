import '../../data/models/models.dart';

abstract class AdminSettingsRepositories {
  Future<ActiveSchoolTerm> getActiveTerm();
  Future<AdminSetting> getAdminSetting();
  Future createAdminSetting(AdminSetting adminSetting);
  Future<List<Subject>> getAllSchoolSubjects();
  Future updateAdminSetting(AdminSetting adminSetting);
  Future updateActiveTerm(ActiveSchoolTerm activeSchoolTerm);
}
