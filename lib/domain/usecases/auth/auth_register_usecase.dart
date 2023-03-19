import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/core/usecase/usecase.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

import '../../repositories_contracts/auth_repository.dart';

class AuthRegisterUseCase extends UseCase<bool, UserParams>{
  final AuthRepository _repository;

  AuthRegisterUseCase(this._repository);

  @override
  Future<Either<Failure, bool>> call(UserParams params) async {
    return await _repository.register(params.user);
  }
}