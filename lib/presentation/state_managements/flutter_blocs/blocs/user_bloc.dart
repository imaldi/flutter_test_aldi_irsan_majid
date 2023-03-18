import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/user_register_usecase.dart';

import '../../../../data/models/user_model.dart';
import '../../../../domain/usecases/user_login_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserLoginUseCase _userLoginUseCase;
  UserRegisterUseCase _userRegisterUseCase;
  UserBloc(this._userLoginUseCase, this._userRegisterUseCase) : super(UserInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(UserAuthLoading());
      var result = await _userLoginUseCase(event.userParams);
      var newState = result.fold((l) => UserLoginFailed(), (r) => UserLoginSuccess());
      emit(newState);
    });

    on<UserRegisterEvent>((event, emit) async {
      emit(UserAuthLoading());
      var result = await _userRegisterUseCase(event.userParams);
      var newState = result.fold((l) => UserLoginFailed(), (r) => UserLoginSuccess());
      emit(newState);
    });
  }
}
