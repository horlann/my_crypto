import 'package:equatable/equatable.dart';

abstract class UserAuthEvent extends Equatable {
  const UserAuthEvent();

  @override
  List<Object?> get props => [];
}

class InitUserEvent extends UserAuthEvent {}

class LoginWithEmailAndPasswordEvent extends UserAuthEvent {
  final String email;
  final String password;

  const LoginWithEmailAndPasswordEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LogoutEvent extends UserAuthEvent {
  const LogoutEvent();
}

class RegisterWithEmailAndPassword extends UserAuthEvent {
  final String email;
  final String password;
  final String nameAndSurname;

  const RegisterWithEmailAndPassword(this.email, this.password, this.nameAndSurname);

  @override
  List<Object?> get props => [email, password, nameAndSurname];
}

class AddToFavoriteEvent extends UserAuthEvent {
  final String slug;

  const AddToFavoriteEvent(this.slug);

  @override
  List<Object?> get props => [slug];
}
