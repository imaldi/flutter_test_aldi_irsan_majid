import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/user_register_usecase.dart';

import '../../../../data/models/user_model.dart';
import '../../../../domain/usecases/check_user_login_status_usecase.dart';
import '../../../../domain/usecases/user_login_usecase.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserLoginUseCase _userLoginUseCase;
  final UserRegisterUseCase _userRegisterUseCase;
  final CheckUserLoginStatusUseCase _checkUserLoginStatusUseCase;

  UserBloc(
      {required UserLoginUseCase userLoginUseCase,
      required UserRegisterUseCase userRegisterUseCase, required CheckUserLoginStatusUseCase checkUserLoginStatusUseCase})
      : _userLoginUseCase = userLoginUseCase,
        _userRegisterUseCase = userRegisterUseCase,
        _checkUserLoginStatusUseCase = checkUserLoginStatusUseCase,
        super(UserInitial()) {
    on<UserLoginEvent>((event, emit) async {
      emit(UserAuthLoading());
      var result = await _userLoginUseCase(event.userParams);
      var newState =
          result.fold((l) => UserLoginFailed(), (r) => UserLoginSuccess());
      emit(newState);
    });

    on<UserRegisterEvent>((event, emit) async {
      emit(UserAuthLoading());
      var result = await _userRegisterUseCase(event.userParams);
      var newState =
          result.fold((l) => UserLoginFailed(), (r) => UserLoginSuccess());
      emit(newState);
    });

    on<UserCheckLoginEvent>((event, emit) async {
      emit(UserAuthLoading());
      var result = await _checkUserLoginStatusUseCase(event.params);
      var newState =
          result.fold((l) => NoCachedLogin(), (r) => UserLoginSuccess());
      emit(newState);
    });
  }
}
