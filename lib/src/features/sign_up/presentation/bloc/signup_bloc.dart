import 'package:api_tempate_flutter/core/authentication/Authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/sign_up.dart';
import '../../domain/usecases/post_sign_up_data.dart';
import '../../exception/signup_exception.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final PostSignUpData postSignUpData;

  SignUpBloc({
    required PostSignUpData signUpData,
  })  : postSignUpData = signUpData,
        super(Empty()) {
    on<EmptyEvent>((event, emit) async {
      emit(Empty());
    });
    on<PostForSignUp>(_handelPostForSignUp);
  }

  Future<void> _handelPostForSignUp(
      PostForSignUp event, Emitter<SignUpState> emit) async {
    try {
      emit(Loading());
      var signUp = SignUp(
          name: event.name.trim(),
          password: event.password.trim(),
          email: event.email.trim(),
          confirmPassword: event.confirmPassword.trim());
      final signUpStatus = await postSignUpData(Params(signUp: signUp));
      if (signUpStatus == AuthStatus.successful) {
        Loaded(
            message: AuthExceptionHandler.generateErrorMessage(signUpStatus));
      } else {
        emit(Error(
            message: AuthExceptionHandler.generateErrorMessage(signUpStatus)));
      }
    } on DioError catch (e) {
      var error = e.response!.data as Map<String, dynamic>;
      var message = SignupErrorModel.fromJson(error);
      emit(Error(message: message.errors.toString()));
    } on Exception catch (e) {
      emit(Error(message: "Something went wrong"));
    }
  }
}
