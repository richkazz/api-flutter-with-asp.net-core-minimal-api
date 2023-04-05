import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../admin_settings.dart';

part 'admin_settings_event.dart';
part 'admin_settings_state.dart';

class AdminSettingsBloc extends Bloc<AdminSettingsEvent, AdminSettingsState> {
  final GetActiveTerm _getActibeTerm;
  final UpdateActiveTerm _updateActibeTerm;
  AdminSettingsBloc(
      {required GetActiveTerm getActibeTerm,
      required UpdateActiveTerm updateActibeTerm})
      : _getActibeTerm = getActibeTerm,
        _updateActibeTerm = updateActibeTerm,
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
    on<FirstTermEvent>(_handelFirstTermEvent);
    on<SecondEvent>(_handelSecondTermEvent);

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
  ActiveSchoolTermEntity? activeSchoolTermEntity;
  void _handelGetActiveTermEvent(
      GetActiveTermEvent event, Emitter<AdminSettingsState> emit) async {
    try {
      var activeSchoolTerm = await _getActibeTerm.call();
      var act = ActiveSchoolTermEntity(
          activeTerm: activeSchoolTerm.activeTerm, id: activeSchoolTerm.id);
      activeSchoolTermEntity = act;
      emit(ActiveSchoolTermState(activeSchoolTerm: act));
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  void _handelFirstTermEvent(
      FirstTermEvent event, Emitter<AdminSettingsState> emit) async {
    try {
      if (activeSchoolTermEntity == null) return;

      await _updateActibeTerm(
          ActiveSchoolTerm(id: activeSchoolTermEntity!.id, activeTerm: 1));
      emit(const FirstTermState(1));
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }

  void _handelSecondTermEvent(
      SecondEvent event, Emitter<AdminSettingsState> emit) async {
    try {
      if (activeSchoolTermEntity == null) return;

      await _updateActibeTerm(
          ActiveSchoolTerm(id: activeSchoolTermEntity!.id, activeTerm: 2));
      emit(const SecondTermState(2));
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }
}
