import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_settings_event.dart';
part 'admin_settings_state.dart';

class AdminSettingsBloc extends Bloc<AdminSettingsEvent, AdminSettingsState> {
  AdminSettingsBloc() : super(AdminSettingsInitial()) {
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
}
