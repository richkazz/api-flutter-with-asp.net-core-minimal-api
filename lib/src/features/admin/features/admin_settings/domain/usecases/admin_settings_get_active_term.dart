import '../../admin_settings.dart';

class GetActiveTerm {
  final AdminSettingsRepositories repository;
  GetActiveTerm(this.repository);

  Future<ActiveSchoolTerm> call() async {
    return await repository.getActiveTerm();
  }
}
