import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/data/datasources/user_local_datasource.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLocalDataSource _userLocalDataSource;
  UserRepositoryImpl(this._userLocalDataSource);
  @override
  Future<Either<Failure, bool>> login(UserEntity user) async {
    // TODO: implement login in local data source
    try{
      var result = await _userLocalDataSource.userLogin(user);
      return Right(result);
    } on LoginException {
      return Left(LoginFailure());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> register(UserEntity user) async {
    try{
      var result = await _userLocalDataSource.userRegister(user);
      return Right(result);
    } on RegisterException {
      return Left(RegisterFailure());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

}