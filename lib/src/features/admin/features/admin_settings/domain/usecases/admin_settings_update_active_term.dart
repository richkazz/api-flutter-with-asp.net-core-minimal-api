import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/admin_settings.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/data/models/active_school_term.dart';

class UpdateActiveTerm {
  final AdminSettingsRepositories repository;
  UpdateActiveTerm(this.repository);

  Future call(ActiveSchoolTerm activeSchoolTerm) async {
    return await repository.updateActiveTerm(activeSchoolTerm);
  }
}
