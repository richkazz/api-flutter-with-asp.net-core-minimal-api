import 'package:api_tempate_flutter/src/features/admin/domain/repositories/admin_repositories.dart';
import 'package:api_tempate_flutter/src/models/models.dart';

class CreateAdminSetting {
  final AdminRepositories repository;
  CreateAdminSetting(this.repository);

  Future call(AdminSetting adminSetting) async {
    return await repository.createAdminSetting(adminSetting);
  }
}
