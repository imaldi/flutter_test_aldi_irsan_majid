import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());

  void changeUser(Function(void Function(UserState) emit, User userModel) changeUserCallback){
    changeUserCallback(emit, state.user ?? const User());
  }
}