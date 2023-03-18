import 'package:flutter/cupertino.dart';
import 'package:flutter_test_aldi_irsan_majid/data/datasources/user_local_datasource.dart';
import 'package:flutter_test_aldi_irsan_majid/data/repositories/user_repository_impl.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/user_repository.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/user_login_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/user_register_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/user_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // bloc
  sl.registerLazySingleton(() => UserBloc(sl(), sl()));

  // usecase
  sl.registerFactory(() => UserRegisterUseCase(sl<UserRepository>()));
  sl.registerFactory(() => UserLoginUseCase(sl<UserRepository>()));

  // repository
  sl.registerFactory<UserRepository>(() => UserRepositoryImpl(sl<UserLocalDataSource>()));

  // data source
  // local
  sl.registerFactory<UserLocalDataSource>(() => UserLocalDataSourceImpl());
}
