part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class Empty extends LoginState {}

class Loading extends LoginState {}

class Loaded extends LoginState {
  final String message;

  Loaded({required this.message});
  @override
  List<Object> get props => [message];
}

class Error extends LoginState {
  final String message;

  Error({required this.message});
  @override
  List<Object> get props => [message];
}
