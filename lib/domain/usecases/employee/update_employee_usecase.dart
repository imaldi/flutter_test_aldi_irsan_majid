import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';

import '../../repositories_contracts/employee_repository.dart';

class UpdateEmployeeUsecase extends UseCase<bool, UserParams>{
  final EmployeeRepository _repository;
  UpdateEmployeeUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(UserParams params) async {
    return await _repository.updateEmployee(params.user);
  }
}