import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';

import '../../../data/models/user_model.dart';
import '../../repositories_contracts/employee_repository.dart';

class ReadAllEmployeeUsecase extends UseCase<List<User>,NoParams>{
  EmployeeRepository _repository;
  ReadAllEmployeeUsecase(this._repository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}