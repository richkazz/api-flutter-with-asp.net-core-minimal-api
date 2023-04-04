part of 'signup_bloc.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyEvent extends SignUpEvent {}

class PostForSignUp extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  PostForSignUp(
      {required this.name,
      required this.email,
      required this.password,
      required this.confirmPassword});

  @override
  List<Object> get props => [name, email, password, confirmPassword];
}
