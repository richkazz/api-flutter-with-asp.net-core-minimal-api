import 'package:api_tempate_flutter/core/authentication/authentication.dart';
import 'package:api_tempate_flutter/core/error/error.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/login.dart';
import '../../domain/usecases/post_login.dart';
import '../../exception/login_exception.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLogin postLogin;
  LoginBloc({required PostLogin login})
      : postLogin = login,
        super(LoginInitial()) {
    on<EmptyEvent>((event, emit) async {
      emit(Empty());
    });
    on<PostLoginEvent>(_handlePostLoginEvent);
  }

  Future<void> _handlePostLoginEvent(
    PostLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(Loading());
    var login = Login(
      password: event.password,
      email: event.email,
    );
    try {
      final signUp = await postLogin(Params(login: login));
      if (signUp == AuthStatus.successful) {
        return emit(Loaded(message: "login successful"));
      } else {
        emit(Error(message: AuthExceptionHandler.generateErrorMessage(signUp)));
      }
    } on DioError catch (e) {
      var error = e.response!.data as Map<String, dynamic>;
      var message = LoginError.fromJson(error);
      emit(Error(message: message.error));
    } on Exception catch (e) {
      emit(Error(message: "Something went wrong"));
    }
  }
}
