import '../../admin_settings.dart';

class UpdateActiveTerm {
  final AdminSettingsRepositories repository;
  UpdateActiveTerm(this.repository);

  Future call(ActiveSchoolTerm activeSchoolTerm) async {
    return await repository.updateActiveTerm(activeSchoolTerm);
  }
}
