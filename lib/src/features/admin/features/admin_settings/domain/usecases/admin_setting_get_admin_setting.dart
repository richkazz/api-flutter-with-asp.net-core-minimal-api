import '../../admin_settings.dart';

class GetAdminSetting {
  final AdminSettingsRepositories repository;
  GetAdminSetting(this.repository);

  Future<AdminSetting> call() async {
    return await repository.getAdminSetting();
  }
}
