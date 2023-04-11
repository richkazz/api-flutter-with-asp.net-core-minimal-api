import 'package:api_tempate_flutter/src/features/admin/domain/repositories/admin_repositories.dart';
import 'package:api_tempate_flutter/src/models/subject.dart';

class GetAllSchoolSubject {
  final AdminRepositories repository;
  GetAllSchoolSubject(this.repository);

  Future<List<Subject>> call() async {
    return await repository.getAllSchoolSubjects();
  }
}
