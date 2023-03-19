import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';

import '../../../data/models/user_model.dart';
import '../../repositories_contracts/employee_repository.dart';

class ReadOneEmployeeUsecase extends UseCase<User, UserParams> {
  final EmployeeRepository _repository;
  ReadOneEmployeeUsecase(this._repository);

  @override
  Future<Either<Failure, User>> call(UserParams params) async {
    return await _repository.readOneEmployee(params.user.id ?? 0);
  }

}