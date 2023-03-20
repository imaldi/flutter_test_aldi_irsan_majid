import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // If the subclasses have some properties, they'll get passed to this constructor
  // so that Equatable can perform value comparison.
  @override
  List<Object?> get props => [];
}

class DatabaseFailure extends Failure {}
class DataNotFoundFailure extends Failure {}
class RegisterFailure extends Failure {}
class LoginFailure extends Failure {}
class CachedLoginFailure extends Failure {}
class LogoutFailure extends Failure {}
class NoInternetFailure extends Failure {}
class LocationServiceDisabledFailure extends Failure {}
class PermissionDeniedFailure extends Failure {}
class LocationFailure extends Failure {}
