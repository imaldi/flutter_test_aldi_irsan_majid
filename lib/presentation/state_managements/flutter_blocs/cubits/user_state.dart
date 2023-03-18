part of 'user_cubit.dart';

class UserState extends Equatable {
  final User? user;
  UserState({this.user});
  @override
  List<Object?> get props => [user];
}
