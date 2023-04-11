import 'package:api_tempate_flutter/src/features/admin/domain/repositories/admin_repositories.dart';
import 'package:api_tempate_flutter/src/models/models.dart';

class GetActiveTerm {
  final AdminRepositories repository;
  GetActiveTerm(this.repository);

  Future<ActiveSchoolTerm> call() async {
    return await repository.getActiveTerm();
  }
}
