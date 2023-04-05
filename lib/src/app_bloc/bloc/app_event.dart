part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class InitialAppEvent extends AppEvent {
  const InitialAppEvent();
}

class NotifyConfirmationEvent extends AppEvent {
  final Function function;

  const NotifyConfirmationEvent(this.function);
}
