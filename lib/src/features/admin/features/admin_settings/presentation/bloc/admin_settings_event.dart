part of 'admin_settings_bloc.dart';

abstract class AdminSettingsEvent extends Equatable {
  const AdminSettingsEvent();

  @override
  List<Object> get props => [];
}

class NavCloseEvent extends AdminSettingsEvent {}

class NavOpenEvent extends AdminSettingsEvent {}

class FirstTermEvent extends AdminSettingsEvent {}

class SecondEvent extends AdminSettingsEvent {}

class GetActiveTermEvent extends AdminSettingsEvent {}

class GetAdminSettingsEvent extends AdminSettingsEvent {}

class PostAdminSettingsEvent extends AdminSettingsEvent {}

class GetAllSchoolSubjectEvent extends AdminSettingsEvent {}

class ChangeJuniorSeniorEvent extends AdminSettingsEvent {
  final bool isSenior;

  const ChangeJuniorSeniorEvent(this.isSenior);
}

class ExamScoreTypeEvent extends AdminSettingsEvent {
  final int exanType;

  const ExamScoreTypeEvent(this.exanType);
}
