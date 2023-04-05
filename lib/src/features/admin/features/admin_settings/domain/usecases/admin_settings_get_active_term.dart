import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/data/models/active_school_term.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/domain/repositories/admin_settings_repositories.dart';

class GetActiveTerm {
  final AdminSettingsRepositories repository;
  GetActiveTerm(this.repository);

  Future<ActiveSchoolTerm> call() async {
    return await repository.getActiveTerm();
  }
}
