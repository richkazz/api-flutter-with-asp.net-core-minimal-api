import 'dart:async';
import 'package:api_tempate_flutter/core/error/error.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/data/models/subject.dart';
import 'package:api_tempate_flutter/src/features/admin/features/admin_settings/domain/usecases/admin_settings_get_all_subjects.dart';
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
  final GetAllSchoolSubject _getAllSchoolSubject;
  final GetAdminSetting _getAdminSetting;
  final UpdateAdminSetting _updateAdminSetting;
  final CreateAdminSetting _createAdminSetting;
  AdminSettingsBloc(
      {required GetActiveTerm getActibeTerm,
      required UpdateActiveTerm updateActibeTerm,
      required GetAdminSetting getAdminSetting,
      required UpdateAdminSetting updateAdminSetting,
      required CreateAdminSetting createAdminSetting,
      required GetAllSchoolSubject getAllSchoolSubject})
      : _getActibeTerm = getActibeTerm,
        _updateActibeTerm = updateActibeTerm,
        _getAllSchoolSubject = getAllSchoolSubject,
        _createAdminSetting = createAdminSetting,
        _getAdminSetting = getAdminSetting,
        _updateAdminSetting = updateAdminSetting,
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
    on<GetAdminSettingsEvent>(_handelGetAdminSettingsEvent);
    on<PostAdminSettingsEvent>(_handelPostAdminSettingsEvent);
    on<GetAllSchoolSubjectEvent>(_handelGetAllSchoolSubjectEvent);

    on<ExamScoreTypeEvent>(_handelExamScoreTypeEvent);
  }

  ActiveSchoolTermEntity? activeSchoolTermEntity;
  Set<int> juniorSchoolSubjectSet = {};
  Set<int> seniorSchoolSubjectSet = {};
  Set<String> schoolClasses = {};
  int currentGradingSystem = 1;

  void _handelExamScoreTypeEvent(
      ExamScoreTypeEvent event, Emitter<AdminSettingsState> emit) {
    currentGradingSystem = event.exanType;
    if (event.exanType == 1) {
      emit(ExamScoreTypeState(exanType: event.exanType));
    } else {
      emit(ExamScoreTypeStateSecond(exanType: event.exanType));
    }
  }

  void _handelGetActiveTermEvent(
      GetActiveTermEvent event, Emitter<AdminSettingsState> emit) async {
    try {
      if (activeSchoolTermEntity != null) {
        emit(ActiveSchoolTermState(activeSchoolTerm: activeSchoolTermEntity!));
      }
      var activeSchoolTerm = await _getActibeTerm.call();
      ActiveSchoolTermEntity schoolTerm = ActiveSchoolTermEntity(
          activeTerm: activeSchoolTerm.activeTerm, id: activeSchoolTerm.id);
      activeSchoolTermEntity = schoolTerm;
      emit(ActiveSchoolTermState(activeSchoolTerm: schoolTerm));
    } on DioError catch (e) {
      var error = e.response!.data as Map<String, dynamic>;
      var message = ErrorResponse.fromJson(error);
      if (kDebugMode) {
        print(message);
      }
    }
  }

  void _handelGetAdminSettingsEvent(
      GetAdminSettingsEvent event, Emitter<AdminSettingsState> emit) async {
    try {
      if (seniorSchoolSubjectSet.isNotEmpty ||
          juniorSchoolSubjectSet.isNotEmpty) {
        _fillInAdminSettingData(emit);
        return;
      }
      AdminSetting adminSetting = await _getAdminSetting.call();
      juniorSchoolSubjectSet = adminSetting.juniorSchoolSubjects
          .map((e) => e.schoolSubjects!.id)
          .toSet();
      seniorSchoolSubjectSet = adminSetting.seniorSchoolSubjects
          .map((e) => e.schoolSubjects!.id)
          .toSet();
      schoolClasses =
          adminSetting.classInSchools.map((e) => e.className).toSet();
      if (adminSetting.currentGradingSystems != null) {
        currentGradingSystem =
            adminSetting.currentGradingSystems!.gradingSystem;
      }

      emit(GetAdminSettingState(adminSetting));
      emit(SchoolClasseSetState(schoolClasses: schoolClasses));
      emit(SuniorAndSeniorSchoolSubjectSet(
          juniorSchoolSubjectSet: juniorSchoolSubjectSet,
          seniorSchoolSubjectSet: seniorSchoolSubjectSet));
    } on DioError catch (e) {
      var error = e.response!.data as Map<String, dynamic>;
      var message = ErrorResponse.fromJson(error);
      if (kDebugMode) {
        print(message);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  void _fillInAdminSettingData(Emitter<AdminSettingsState> emit) {
    AdminSetting adminSetting = AdminSetting(
        classInSchools:
            schoolClasses.map((e) => ClassInSchool(className: e)).toList(),
        seniorSchoolSubjects: seniorSchoolSubjectSet
            .map((e) => SeniorSchoolSubject(subjectId: e))
            .toList(),
        juniorSchoolSubjects: juniorSchoolSubjectSet
            .map((e) => JuniorSchoolSubject(subjectId: e))
            .toList(),
        currentGradingSystems:
            CurrentGradingSystem(gradingSystem: currentGradingSystem));
    emit(GetAdminSettingState(adminSetting));
    emit(SchoolClasseSetState(schoolClasses: schoolClasses));
    emit(SuniorAndSeniorSchoolSubjectSet(
        juniorSchoolSubjectSet: juniorSchoolSubjectSet,
        seniorSchoolSubjectSet: seniorSchoolSubjectSet));
  }

  void _handelPostAdminSettingsEvent(
      PostAdminSettingsEvent event, Emitter<AdminSettingsState> emit) async {
    try {
      AdminSetting adminSetting = AdminSetting(
          classInSchools:
              schoolClasses.map((e) => ClassInSchool(className: e)).toList(),
          seniorSchoolSubjects: seniorSchoolSubjectSet
              .map((e) => SeniorSchoolSubject(subjectId: e))
              .toList(),
          juniorSchoolSubjects: juniorSchoolSubjectSet
              .map((e) => JuniorSchoolSubject(subjectId: e))
              .toList(),
          currentGradingSystems:
              CurrentGradingSystem(gradingSystem: currentGradingSystem));
      await _createAdminSetting.call(adminSetting);
    } on DioError catch (e) {
      var error = e.response!.data as Map<String, dynamic>;
      var message = ErrorResponse.fromJson(error);
      if (kDebugMode) {
        print(message);
      }
    }
  }

  void _handelGetAllSchoolSubjectEvent(
      GetAllSchoolSubjectEvent event, Emitter<AdminSettingsState> emit) async {
    try {
      var subjectList = await _getAllSchoolSubject.call();
      emit(GetAllSchoolSubjectState(subjectList));
    } on DioError catch (e) {
      var error = e.response!.data as Map<String, dynamic>;
      var message = ErrorResponse.fromJson(error);
      if (kDebugMode) {
        print(message.errors.join(","));
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
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
      var error = e.response!.data as Map<String, dynamic>;
      var message = ErrorResponse.fromJson(error);
      if (kDebugMode) {
        print(message);
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
      var error = e.response!.data as Map<String, dynamic>;
      var message = ErrorResponse.fromJson(error);
      if (kDebugMode) {
        print(message);
      }
    }
  }
}
