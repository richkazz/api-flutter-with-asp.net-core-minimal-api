part of 'account_bloc.dart';

abstract class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

class AccountInitial extends AccountState {}

class TeacherRegisterationState extends AccountState {}

class StaffAndStudentState extends AccountState {}

class GetAllSchoolSubjectState extends AccountState {
  final List<Subject> schoolSubjectsList;
  const GetAllSchoolSubjectState(this.schoolSubjectsList);
}
