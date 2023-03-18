part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

class UserAuthLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoginSuccess extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoginFailed extends UserState {
  @override
  List<Object> get props => [];
}

class UserRegisterSuccess extends UserState {
  @override
  List<Object> get props => [];
}

class UserRegisterFailed extends UserState {
  @override
  List<Object> get props => [];
}
