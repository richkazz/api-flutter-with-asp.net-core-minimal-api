import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/data/data_source/admin_settings_remote_data_source.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/data/models/active_school_term.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/domain/repositories/admin_settings_repositories.dart';

class AdminSettingsRepositoryImpl implements AdminSettingsRepositories {
  final AdminSettingsRemoteDataSource remoteDataSource;

  AdminSettingsRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<ActiveSchoolTerm> getActiveTerm() async {
    return await remoteDataSource.getActiveTerm();
  }
}
