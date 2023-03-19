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

final sl = GetIt.instance;

Future<void> init() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // bloc
  sl.registerLazySingleton(() => AuthBloc(authLoginUseCase: sl(), authRegisterUseCase: sl(), checkAuthLoginStatusUseCase: sl()));
  sl.registerFactory(() => EmployeeBloc(sl(), sl(), sl(), sl(), sl()));

  // usecase
  sl.registerLazySingleton(() => AuthRegisterUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => AuthLoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => AuthCheckLoginStatusUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => CreateEmployeeUsecase(sl<EmployeeRepository>()));
  sl.registerLazySingleton(() => ReadAllEmployeeUsecase(sl<EmployeeRepository>()));
  sl.registerLazySingleton(() => ReadOneEmployeeUsecase(sl<EmployeeRepository>()));
  sl.registerLazySingleton(() => UpdateEmployeeUsecase(sl<EmployeeRepository>()));
  sl.registerLazySingleton(() => DeleteEmployeeUsecase(sl<EmployeeRepository>()));

  // repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<AuthLocalDataSource>()));
  sl.registerLazySingleton<EmployeeRepository>(() => EmployeeRepositoryImpl(sl<EmployeeLocalDatasource>()));

  // data source
  // local
  sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl());
  sl.registerLazySingleton<EmployeeLocalDatasource>(() => EmployeeLocalDatasourceImpl());
}
