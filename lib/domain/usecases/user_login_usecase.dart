import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/user_repository.dart';

class UserLoginUseCase extends UseCase<bool, UserParams>{
  final UserRepository _repository;
  UserLoginUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(UserParams params) async {
    return await _repository.login(params.user);
  }
}