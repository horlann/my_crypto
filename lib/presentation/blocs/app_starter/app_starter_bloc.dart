import 'package:bloc/bloc.dart';

import 'app_starter_event.dart';
import 'app_starter_state.dart';

class AppStarterBloc extends Bloc<AppStarterEvent, AppStarterState> {
  AppStarterBloc() : super(AppStarterState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<AppStarterState> emit) async {
    emit(state.clone());
  }
}
