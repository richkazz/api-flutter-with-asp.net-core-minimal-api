import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NotifyConfirmationEvent>(_handelNotifyConfirmationEvent);
    on<InitialAppEvent>(_handelInitialAppEvent);
  }

  void _handelNotifyConfirmationEvent(
      NotifyConfirmationEvent event, Emitter<AppState> emit) {
    emit(NotifyConfirmationState(event.function));
  }

  void _handelInitialAppEvent(InitialAppEvent event, Emitter<AppState> emit) {
    emit(AppInitial());
  }
}
