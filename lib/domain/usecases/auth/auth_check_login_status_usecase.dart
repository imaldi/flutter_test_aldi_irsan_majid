import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/auth_repository.dart';

class AuthCheckLoginStatusUseCase extends UseCase<bool, NoParams>{
  final AuthRepository _repository;
  AuthCheckLoginStatusUseCase(this._repository);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.checkUserLoginStatus();
  }

}