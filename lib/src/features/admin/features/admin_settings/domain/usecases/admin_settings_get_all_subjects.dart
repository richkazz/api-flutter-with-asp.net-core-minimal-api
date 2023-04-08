import '../../admin_settings.dart';

class GetAllSchoolSubject {
  final AdminSettingsRepositories repository;
  GetAllSchoolSubject(this.repository);

  Future<List<Subject>> call() async {
    return await repository.getAllSchoolSubjects();
  }
}
