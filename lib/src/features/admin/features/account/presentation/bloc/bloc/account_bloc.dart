import 'package:api_tempate_flutter/core/configs/configs.dart';
import 'package:api_tempate_flutter/core/error/error.dart';
import 'package:api_tempate_flutter/src/features/admin/domain/usecases/admin_usecases.dart';
import 'package:api_tempate_flutter/src/features/admin/features/account/enums/account_page_enum.dart';
import 'package:api_tempate_flutter/src/models/subject.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetAllSchoolSubject _getAllSchoolSubject;
  AccountBloc({required GetAllSchoolSubject getAllSchoolSubject})
      : _getAllSchoolSubject = getAllSchoolSubject,
        super(AccountInitial()) {
    on<AccountEvent>((event, emit) {});

    on<AccountPageChangeEvent>(_handelAccountPageChangeEvent);
    on<GetAllSchoolSubjectEvent>(_handelGetAllSchoolSubjectEvent);
  }
  void _handelAccountPageChangeEvent(
      AccountPageChangeEvent event, Emitter<AccountState> emit) {
    switch (event.accountPageChange) {
      case AccountPageChange.staffAndStudent:
        {
          emit(StaffAndStudentState());
          break;
        }
      case AccountPageChange.teacherRegister:
        {
          emit(TeacherRegisterationState());
          break;
        }
    }
  }

  void _handelGetAllSchoolSubjectEvent(
      GetAllSchoolSubjectEvent event, Emitter<AccountState> emit) async {
    try {
      var subjectList = await _getAllSchoolSubject.call();
      emit(GetAllSchoolSubjectState(subjectList));
    } on DioError catch (e) {
      var error = e.response!.data as Map<String, dynamic>;
      var message = ErrorResponse.fromJson(error);
      Configs.errorLogger(message.errors.join(','),
          className: "AdminSettingsBloc",
          methodName: "_handelGetAllSchoolSubjectEvent",
          exceptionName: "DioError");
    }
  }
}
