import 'package:bloc/bloc.dart';
import 'package:my_crypto/domain/entities/user/user_entity.dart';
import 'package:my_crypto/domain/use_cases/user/get_current_user_usecase.dart';
import 'package:my_crypto/domain/use_cases/user/user_sign_in_usecase.dart';
import 'package:my_crypto/domain/use_cases/user/user_sign_out_usecase.dart';
import 'package:my_crypto/domain/use_cases/user/user_sign_up_usecase.dart';
import 'package:my_crypto/internal/core/usecases.dart';
import 'package:my_crypto/main.dart';
import 'package:uuid/uuid.dart';

import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userSignInUseCase, this._userSignOutUseCase, this._userSignUpUseCase, this._getCurrentUserUseCase)
      : super(const UserState().inProgress()) {
    on<InitUserEvent>(_onAppStarted);
    on<LoginWithEmailAndPasswordEvent>(_loginWithEmailAndPassword);
    on<RegisterWithEmailAndPassword>(_registerWithEmailAndPassword);
    on<LogoutEvent>(_logout);
  }

  final UserSignInUseCase _userSignInUseCase;
  final UserSignOutUseCase _userSignOutUseCase;
  final UserSignUpUseCase _userSignUpUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;

  void _onAppStarted(InitUserEvent event, Emitter<UserState> emit) async {
    emit(state.unauthorizedState());
    // try {
    //   final currentUser = await _getCurrentUserUseCase.call(NoParams());
    //   currentUser.fold(
    //       (l) => emit(state.authorizationErrorState('')),
    //       (r) => {
    //             if (r != null) {emit(state.authorized(userEntity: r))} else {emit(state.unauthorizedState())}
    //           });
    // } catch (e) {
    //   emit(state.authorizationErrorState(''));
    //   logger.e(e);
    // }
  }

  Future<void> _loginWithEmailAndPassword(LoginWithEmailAndPasswordEvent event, Emitter<UserState> emit) async {
    emit(state.inProgress());
    try {
      final registerResult = await _userSignInUseCase.call(SignInParams(event.email, event.password));
      registerResult.fold((l) => emit(state.authorizationErrorState('')), (r) => emit(state.authorized(userEntity: r)));
    } catch (e) {
      emit(state.authorizationErrorState(''));
      logger.e(e);
    }
  }

  Future<void> _registerWithEmailAndPassword(RegisterWithEmailAndPassword event, Emitter<UserState> emit) async {
    emit(state.inProgress());
    try {
      final registerResult = await _userSignUpUseCase.call(SignUpParams(UserEntity(
          email: 'tortos124@gmail.com', imageLink: '', name: 'Danil', password: '123456', uuid: const Uuid().v4())));
      registerResult.fold((l) => emit(state.authorizationErrorState('')), (r) => emit(state.authorized(userEntity: r)));
    } catch (e) {
      emit(state.authorizationErrorState(''));
      logger.e(e);
    }
  }

  Future<void> _logout(LogoutEvent event, Emitter<UserState> emit) async {
    emit(state.inProgress());
    try {
      final registerResult = await _userSignOutUseCase.call(NoParams());
      registerResult.fold((l) => emit(state.authorizationErrorState('')), (r) => emit(state.unauthorizedState()));
    } catch (e) {
      emit(state.authorizationErrorState(''));
      logger.e(e);
    }
  }
}
