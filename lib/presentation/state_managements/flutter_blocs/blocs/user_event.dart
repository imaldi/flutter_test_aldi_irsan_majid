part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class UserLoginEvent extends UserEvent {
  UserParams userParams;
  UserLoginEvent(this.userParams);
  @override
  List<Object?> get props => [userParams];
}

class UserRegisterEvent extends UserEvent {
  UserParams userParams;
  UserRegisterEvent(this.userParams);
  @override
  List<Object?> get props => [userParams];
}
