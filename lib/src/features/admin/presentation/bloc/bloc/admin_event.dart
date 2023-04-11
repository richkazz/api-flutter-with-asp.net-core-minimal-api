part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class ChangePageEvent extends AdminEvent {
  final PageChange page;

  const ChangePageEvent(this.page);
}
