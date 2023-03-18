import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

import '../repositories_contracts/user_repository.dart';

class RegisterUserUseCase extends UseCase<UserEntity, NoParams, UserRepository>{
  @override
  final UserRepository repository;

  RegisterUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}