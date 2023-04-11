import 'package:api_tempate_flutter/src/features/admin/domain/repositories/admin_repositories.dart';
import 'package:api_tempate_flutter/src/models/models.dart';

class UpdateActiveTerm {
  final AdminRepositories repository;
  UpdateActiveTerm(this.repository);

  Future call(ActiveSchoolTerm activeSchoolTerm) async {
    return await repository.updateActiveTerm(activeSchoolTerm);
  }
}
