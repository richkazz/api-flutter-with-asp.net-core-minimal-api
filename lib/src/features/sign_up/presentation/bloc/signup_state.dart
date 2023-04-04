part of 'signup_bloc.dart';

@immutable
abstract class SignUpState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends SignUpState {}

class Loading extends SignUpState {}

class Loaded extends SignUpState {
  final String message;
  Loaded({required this.message});
  @override
  List<Object> get props => [message];
}

class Error extends SignUpState {
  final String message;

  Error({required this.message});
  @override
  List<Object> get props => [message];
}
