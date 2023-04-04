part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class PostLoginEvent extends LoginEvent {
  final String email;
  final String password;

  PostLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

class EmptyEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}
