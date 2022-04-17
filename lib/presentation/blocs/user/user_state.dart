import 'package:my_crypto/domain/entities/user/user_entity.dart';

class UserState {
  const UserState();

  UserState clone() {
    return const UserState();
  }

  UserState authorized({required UserEntity userEntity}) {
    return AuthorizedState(userEntity);
  }

  UserState unauthorizedState() {
    return const UnauthorizedState();
  }

  UserState authorizationErrorState(String error) {
    return AuthorizationErrorState(error);
  }

  UserState inProgress() {
    return const InProgressAuthState();
  }

  @override
  List<Object?> get props => [];
}

class InProgressAuthState extends UserState {
  const InProgressAuthState();
}

class UserDataLoaded extends UserState {
  const UserDataLoaded();
}

class UnauthorizedState extends UserState {
  const UnauthorizedState();
}

class AuthorizationErrorState extends UserState {
  const AuthorizationErrorState(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}

class AuthorizedState extends UserState {
  final UserEntity user;

  const AuthorizedState(this.user);
}
