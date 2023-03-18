import 'package:flutter/cupertino.dart';
import 'package:flutter_test_aldi_irsan_majid/data/datasources/user_local_datasource.dart';
import 'package:flutter_test_aldi_irsan_majid/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/auth_repository.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/auth/auth_login_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/auth/auth_register_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // bloc
  sl.registerLazySingleton(() => AuthBloc(authLoginUseCase: sl(), authRegisterUseCase: sl(), checkAuthLoginStatusUseCase: sl()));

  // usecase
  sl.registerFactory(() => AuthRegisterUseCase(sl<AuthRepository>()));
  sl.registerFactory(() => AuthLoginUseCase(sl<AuthRepository>()));

  // repository
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl<UserLocalDataSource>()));

  // data source
  // local
  sl.registerFactory<UserLocalDataSource>(() => UserLocalDataSourceImpl());
}
