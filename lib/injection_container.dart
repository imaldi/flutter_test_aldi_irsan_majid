import 'package:flutter/material.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/db_keys/app_db_consts.dart';
import 'package:flutter_test_aldi_irsan_majid/data/datasources/auth_local_datasource.dart';
import 'package:flutter_test_aldi_irsan_majid/data/datasources/employee_local_datasource.dart';
import 'package:flutter_test_aldi_irsan_majid/data/repositories/auth_repository_impl.dart';
import 'package:flutter_test_aldi_irsan_majid/data/repositories/employee_repository_impl.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/auth_repository.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/employee_repository.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/auth/auth_check_login_status_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/auth/auth_login_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/auth/auth_register_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/employee/create_employee_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/employee/delete_employee_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/employee/read_all_employee_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/employee/read_one_employee_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/usecases/employee/update_employee_usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/auth/auth_bloc.dart';
import 'package:flutter_test_aldi_irsan_majid/presentation/state_managements/flutter_blocs/blocs/employee/employee_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

import 'presentation/screens/detail_screen.dart';
import 'presentation/screens/home_screen.dart';
final sl = GetIt.instance;

Future<void> init() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // db
  sl.registerLazySingletonAsync<Database>(() async => await openDatabase(dbName,
    version: 1,
    onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE $userTable (id INTEGER PRIMARY KEY, name TEXT DEFAULT '', email TEXT DEFAULT '', password TEXT DEFAULT '', address TEXT DEFAULT '', gender TEXT DEFAULT '', phone_number TEXT DEFAULT '',)');
    }
  ));

  // bloc
  sl.registerLazySingleton(() => AuthBloc(authLoginUseCase: sl(), authRegisterUseCase: sl(), checkAuthLoginStatusUseCase: sl()));
  sl.registerFactory(() => EmployeeBloc(sl(), sl(), sl(), sl(), sl()));

  // usecase
  sl.registerFactory(() => AuthRegisterUseCase(sl<AuthRepository>()));
  sl.registerFactory(() => AuthLoginUseCase(sl<AuthRepository>()));
  sl.registerFactory(() => AuthCheckLoginStatusUseCase(sl<AuthRepository>()));
  sl.registerFactory(() => CreateEmployeeUsecase(sl<EmployeeRepository>()));
  sl.registerFactory(() => ReadAllEmployeeUsecase(sl<EmployeeRepository>()));
  sl.registerFactory(() => ReadOneEmployeeUsecase(sl<EmployeeRepository>()));
  sl.registerFactory(() => UpdateEmployeeUsecase(sl<EmployeeRepository>()));
  sl.registerFactory(() => DeleteEmployeeUsecase(sl<EmployeeRepository>()));

  // repository
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl(sl<AuthLocalDataSource>()));
  sl.registerFactory<EmployeeRepository>(() => EmployeeRepositoryImpl(sl<EmployeeLocalDatasource>()));

  // data source
  // local
  sl.registerFactory<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl<Database>()));
  sl.registerFactory<EmployeeLocalDatasource>(() => EmployeeLocalDatasourceImpl(sl<Database>()));
}
