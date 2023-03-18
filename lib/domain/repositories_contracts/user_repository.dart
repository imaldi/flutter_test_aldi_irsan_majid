import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/base_repository/base_repository.dart';

import '../../core/error/failures.dart';

abstract class UserRepository extends BaseRepository<UserEntity> {
  Future<Either<Failure, bool>> register(UserEntity user);
  Future<Either<Failure, bool>> login(UserEntity user);
}