import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/user_repository.dart';

class UserLogoutUseCase extends UseCase<bool, NoParams>{
  final UserRepository _repository;
  UserLogoutUseCase(this._repository);
  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await _repository.logout();
  }


}