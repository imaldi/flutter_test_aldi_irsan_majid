part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class AuthLoginSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoginFailed extends AuthState {
  final String message;
  const AuthLoginFailed(this.message);
  @override
  List<Object> get props => [message];
}

class NoCachedLogin extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthRegisterSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthRegisterFailed extends AuthState {
  final String message;
  const AuthRegisterFailed(this.message);
  @override
  List<Object> get props => [message];
}