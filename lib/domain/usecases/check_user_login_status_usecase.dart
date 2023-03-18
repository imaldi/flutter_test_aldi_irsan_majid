import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/user_repository.dart';

class CheckUserLoginStatusUsecase extends UseCase<bool, NoParams>{
  final UserRepository _repository;
  CheckUserLoginStatusUsecase(this._repository);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.checkUserLoginStatus();
  }

}