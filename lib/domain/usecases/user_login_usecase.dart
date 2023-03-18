import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/user_repository.dart';

class UserLoginUseCase extends UseCase<UserEntity, UserParams, UserRepository>{
  @override
  final UserRepository repository;
  UserLoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(UserParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }


}