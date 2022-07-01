import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class InitUserEvent extends UserEvent {}

class LoginWithEmailAndPasswordEvent extends UserEvent {
  final String email;
  final String password;

  const LoginWithEmailAndPasswordEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class LogoutEvent extends UserEvent {
  const LogoutEvent();
}

class RegisterWithEmailAndPassword extends UserEvent {
  final String email;
  final String password;
  final String nameAndSurname;

  const RegisterWithEmailAndPassword(this.email, this.password, this.nameAndSurname);

  @override
  List<Object?> get props => [email, password, nameAndSurname];
}
