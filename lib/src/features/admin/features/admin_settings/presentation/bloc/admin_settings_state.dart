part of 'admin_settings_bloc.dart';

abstract class AdminSettingsState extends Equatable {
  const AdminSettingsState();

  @override
  List<Object> get props => [];
}

class AdminSettingsInitial extends AdminSettingsState {}

class FirstTermState extends AdminSettingsState {
  final int term;

  const FirstTermState(this.term);
}

class SecondTermState extends AdminSettingsState {
  final int term;

  const SecondTermState(this.term);
}

class ActiveSchoolTermState extends AdminSettingsState {
  final ActiveSchoolTermEntity activeSchoolTerm;
  const ActiveSchoolTermState({required this.activeSchoolTerm});
}

class NavCloseState extends AdminSettingsState {}

class NavOpenState extends AdminSettingsState {}

class GetAllSchoolSubjectState extends AdminSettingsState {
  final List<Subject> schoolSubjectsList;
  const GetAllSchoolSubjectState(this.schoolSubjectsList);
}

class GetAdminSettingState extends AdminSettingsState {
  final AdminSetting adminSetting;
  const GetAdminSettingState(this.adminSetting);
}

class SuniorAndSeniorSchoolSubjectSet extends AdminSettingsState {
  final Set<int> juniorSchoolSubjectSet;
  final Set<int> seniorSchoolSubjectSet;
  const SuniorAndSeniorSchoolSubjectSet(
      {required this.juniorSchoolSubjectSet,
      required this.seniorSchoolSubjectSet});
}

class SchoolClasseSetState extends AdminSettingsState {
  final Set<String> schoolClasses;
  const SchoolClasseSetState({required this.schoolClasses});
}

class SeniorSchoolState extends AdminSettingsState {}

class JuniorSchoolState extends AdminSettingsState {}

class ExamScoreTypeState extends AdminSettingsState {
  final int exanType;

  const ExamScoreTypeState({required this.exanType});
}

class ExamScoreTypeStateSecond extends AdminSettingsState {
  final int exanType;

  const ExamScoreTypeStateSecond({required this.exanType});
}
