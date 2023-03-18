import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

import '../repositories_contracts/user_repository.dart';

class UserRegisterUseCase extends UseCase<UserEntity, UserParams>{
  final UserRepository _repository;

  UserRegisterUseCase(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}