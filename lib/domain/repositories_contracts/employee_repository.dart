import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/base_repository/base_repository.dart';

import '../../core/error/failures.dart';
import '../../data/models/user_model.dart';

abstract class EmployeeRepository  extends BaseRepository{
    Future<Either<Failure, bool>> createEmployee(User user);
    Future<Either<Failure, List<User>>> readAllEmployee();
    Future<Either<Failure, User>> readOneEmployee(int id);
    Future<Either<Failure, bool>> updateEmployee(User user);
    Future<Either<Failure, bool>> deleteEmployee(int id);
}