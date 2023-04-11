import 'package:api_tempate_flutter/src/features/admin/domain/repositories/admin_repositories.dart';
import 'package:api_tempate_flutter/src/models/models.dart';

class UpdateAdminSetting {
  final AdminRepositories repository;
  UpdateAdminSetting(this.repository);

  Future call(AdminSetting adminSetting) async {
    return await repository.updateAdminSetting(adminSetting);
  }
}
