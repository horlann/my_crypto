import 'package:bloc/bloc.dart';
import 'package:my_crypto/main.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<UserState> emit) async {
    emit(state.clone());
  }

  Future<void> _addToFavorite(InitEvent event, Emitter<UserState> emit) async {
    try {} catch (e) {
      logger.e(e);
    }
  }
}
