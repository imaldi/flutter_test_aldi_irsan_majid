part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthLoginEvent extends AuthEvent {
  UserParams userParams;
  AuthLoginEvent(this.userParams);
  @override
  List<Object?> get props => [userParams];
}

class AuthRegisterEvent extends AuthEvent {
  UserParams userParams;
  AuthRegisterEvent(this.userParams);
  @override
  List<Object?> get props => [userParams];
}

class AuthCheckLoginEvent extends AuthEvent {
  NoParams get params => NoParams();

  @override
  List<Object?> get props => [params];
}

