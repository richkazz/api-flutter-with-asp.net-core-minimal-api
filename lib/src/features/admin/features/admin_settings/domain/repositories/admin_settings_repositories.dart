import '../../data/models/active_school_term.dart';

abstract class AdminSettingsRepositories {
  Future<ActiveSchoolTerm> getActiveTerm();
  Future updateActiveTerm(ActiveSchoolTerm activeSchoolTerm);
}
