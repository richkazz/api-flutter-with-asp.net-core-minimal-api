import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../enums/admin_enums.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {
    on<AdminEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangePageEvent>(_handelChangePageEvent);
  }
  void _handelChangePageEvent(ChangePageEvent event, Emitter<AdminState> emit) {
    switch (event.page) {
      case PageChange.settings:
        {
          emit(SettingsPageState());
          break;
        }
      case PageChange.account:
        {
          emit(AccountPageState());
          break;
        }
    }
  }
}
