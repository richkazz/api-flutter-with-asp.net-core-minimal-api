import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/domain/usecases/admin_settings_get_active_term.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/active_school_term_entity.dart';

part 'admin_settings_event.dart';
part 'admin_settings_state.dart';

class AdminSettingsBloc extends Bloc<AdminSettingsEvent, AdminSettingsState> {
  final GetActiveTerm _getActibeTerm;
  AdminSettingsBloc({required GetActiveTerm getActibeTerm})
      : _getActibeTerm = getActibeTerm,
        super(AdminSettingsInitial()) {
    on<AdminSettingsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NavCloseEvent>(
      (event, emit) {
        emit(AdminSettingsInitial());
      },
    );
    on<NavOpenEvent>(
      (event, emit) {
        emit(AdminSettingsInitial());
      },
    );
    on<FirstTermEvent>(
      (event, emit) {
        emit(const FirstTermState(1));
      },
    );
    on<SecondEvent>(
      (event, emit) {
        emit(const SecondTermState(2));
      },
    );

    on<ChangeJuniorSeniorEvent>(
      (event, emit) {
        emit(event.isSenior ? SeniorSchoolState() : JuniorSchoolState());
      },
    );

    on<GetActiveTermEvent>(_handelGetActiveTermEvent);

    on<ExamScoreTypeEvent>(
      (event, emit) {
        if (event.exanType == 1) {
          emit(ExamScoreTypeState(exanType: event.exanType));
        } else {
          emit(ExamScoreTypeStateSecond(exanType: event.exanType));
        }
      },
    );
  }
  void _handelGetActiveTermEvent(
      GetActiveTermEvent event, Emitter<AdminSettingsState> emit) async {
    try {
      var activeSchoolTerm = await _getActibeTerm.call();
      emit(ActiveSchoolTermState(
          activeSchoolTerm: ActiveSchoolTermEntity(
              activeTerm: activeSchoolTerm.activeTerm,
              id: activeSchoolTerm.id)));
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }
}
