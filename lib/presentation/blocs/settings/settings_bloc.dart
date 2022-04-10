import 'package:bloc/bloc.dart';


import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState().updateNumber(0)) {
    on<InitEvent>(_init);
    on<CounterIncrementPressed>(_increment);
    on<CounterDecrementPressed>(_decrement);
  }

  int number = 0;

  void _init(InitEvent event, Emitter<SettingsState> emit) async {}

  void _increment(CounterIncrementPressed event, Emitter<SettingsState> emit) async {
    emit(state.updateNumber(++number));
  }

  void _decrement(CounterDecrementPressed event, Emitter<SettingsState> emit) async {
    emit(state.updateNumber(--number));
  }
}
