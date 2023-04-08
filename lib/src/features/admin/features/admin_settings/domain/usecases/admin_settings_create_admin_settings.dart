import '../../admin_settings.dart';

class CreateAdminSetting {
  final AdminSettingsRepositories repository;
  CreateAdminSetting(this.repository);

  Future call(AdminSetting adminSetting) async {
    return await repository.createAdminSetting(adminSetting);
  }
}
