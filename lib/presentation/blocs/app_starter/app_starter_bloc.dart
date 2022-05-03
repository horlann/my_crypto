import 'package:bloc/bloc.dart';
import 'package:my_crypto/domain/use_cases/application/get_is_on_boarding_shown.dart';
import 'package:my_crypto/domain/use_cases/application/set_is_on_boarding_shown.dart';

import 'app_starter_event.dart';
import 'app_starter_state.dart';

class AppStarterBloc extends Bloc<AppStarterEvent, AppStarterState> {
  AppStarterBloc(
    this._isOnBoardingShownUseCase,
    this._updateOnBoardingStatusUseCase,
  ) : super(const AppStarterState().canStartAppState(false)) {
    on<InitAppEvent>(_init);
  }

  final IsOnBoardingShownUseCase _isOnBoardingShownUseCase;
  final UpdateOnBoardingStatusUseCase _updateOnBoardingStatusUseCase;
  final bool _needToShowOnBoarding = false;

  bool get needToShowOnBoarding => _needToShowOnBoarding;

  void _init(InitAppEvent event, Emitter<AppStarterState> emit) async {
    await Future.delayed(const Duration(seconds: 2)).whenComplete(() => emit(state.canStartAppState(true)));
  }
}
