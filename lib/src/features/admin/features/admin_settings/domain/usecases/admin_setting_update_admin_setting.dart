import '../../admin_settings.dart';

class UpdateAdminSetting {
  final AdminSettingsRepositories repository;
  UpdateAdminSetting(this.repository);

  Future call(AdminSetting adminSetting) async {
    return await repository.updateAdminSetting(adminSetting);
  }
}
