part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountPageChangeEvent extends AccountEvent {
  final AccountPageChange accountPageChange;
  const AccountPageChangeEvent(this.accountPageChange);
}

class GetAllSchoolSubjectEvent extends AccountEvent {}
