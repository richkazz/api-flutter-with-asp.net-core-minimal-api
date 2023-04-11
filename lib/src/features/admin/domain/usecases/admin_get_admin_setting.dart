import 'package:api_tempate_flutter/src/features/admin/domain/repositories/admin_repositories.dart';
import 'package:api_tempate_flutter/src/models/models.dart';

class GetAdminSetting {
  final AdminRepositories repository;
  GetAdminSetting(this.repository);

  Future<AdminSetting> call() async {
    return await repository.getAdminSetting();
  }
}
