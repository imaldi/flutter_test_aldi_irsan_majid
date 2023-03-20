import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/auth/auth_logout_usecase.dart';

import '../../../../../domain/usecases/auth/auth_check_login_status_usecase.dart';
import '../../../../../domain/usecases/auth/auth_login_usecase.dart';
import '../../../../../domain/usecases/auth/auth_register_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthLoginUseCase _authLoginUseCase;
  final AuthRegisterUseCase _authRegisterUseCase;
  final AuthCheckLoginStatusUseCase _authCheckLoginStatusUseCase;
  final AuthLogoutUseCase _authLogoutUseCase;

  AuthBloc(
      {required AuthLoginUseCase authLoginUseCase,
      required AuthRegisterUseCase authRegisterUseCase,
      required AuthCheckLoginStatusUseCase checkAuthLoginStatusUseCase,
      required AuthLogoutUseCase authLogoutUseCase,
      })
      : _authLoginUseCase = authLoginUseCase,
        _authRegisterUseCase = authRegisterUseCase,
        _authCheckLoginStatusUseCase = checkAuthLoginStatusUseCase,
        _authLogoutUseCase = authLogoutUseCase,
        super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      var result = await _authLoginUseCase(event.userParams);
      var newState = result.fold(
          (l) => AuthLoginFailed(l.runtimeType.toString()),
          (r) => AuthLoginSuccess());
      emit(newState);
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthLoading());
      var result = await _authRegisterUseCase(event.userParams);
      var newState = result.fold(
          (l) => AuthRegisterFailed(l.runtimeType.toString()),
          (r) => AuthLoginSuccess());
      emit(newState);
    });

    on<AuthCheckLoginEvent>((event, emit) async {
      emit(AuthLoading());
      var result = await _authCheckLoginStatusUseCase(event.params);
      var newState =
          result.fold((l) => NoCachedLogin(), (r) => AuthLoginSuccess());
      emit(newState);
    });

    on<AuthLogoutEvent>((event, emit) async {
      emit(AuthLoading());
      var result = await _authLogoutUseCase(event.params);
      var newState =
          result.fold((l) => AuthLogoutFailed(l.runtimeType.toString()), (r) => AuthLogoutSuccess());
      emit(newState);
    });
  }
}
