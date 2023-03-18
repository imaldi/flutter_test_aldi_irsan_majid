import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/base_repository/base_repository.dart';

import '../../core/error/failures.dart';
import '../../data/models/user_model.dart';

abstract class AuthRepository extends BaseRepository<User> {
  Future<Either<Failure, bool>> register(User user);
  Future<Either<Failure, bool>> login(User user);
  Future<Either<Failure, bool>> checkUserLoginStatus();
  Future<Either<Failure, bool>> logout();
}