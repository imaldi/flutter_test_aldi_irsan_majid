import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';

import '../../repositories_contracts/employee_repository.dart';

class DeleteEmployeeUsecase extends UseCase<bool, UserParams> {
  EmployeeRepository _repository;

  DeleteEmployeeUsecase(this._repository);

  @override
  Future<Either<Failure, bool>> call(UserParams params) async {
    return await _repository.deleteEmployee(params.user.id ?? 0);
  }
}
