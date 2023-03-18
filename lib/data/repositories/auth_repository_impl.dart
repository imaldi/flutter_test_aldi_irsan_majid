import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/data/datasources/user_local_datasource.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/auth_repository.dart';

import '../models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final UserLocalDataSource _userLocalDataSource;
  AuthRepositoryImpl(this._userLocalDataSource);
  @override
  Future<Either<Failure, bool>> login(User user) async {
    try{
      var result = await _userLocalDataSource.userLogin(user);
      return Right(result);
    } on LoginException {
      return Left(LoginFailure());
    } on CachedLoginException {
      return Left(CachedLoginFailure());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> register(User user) async {
    try{
      var result = await _userLocalDataSource.userRegister(user);
      return Right(result);
    } on RegisterException {
      return Left(RegisterFailure());
    } on DatabaseException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> checkUserLoginStatus() async {
    try{
      var result = await _userLocalDataSource.getCachedLogin();
      return Right(result);
    } on CachedLoginException {
      return Left(CachedLoginFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try{
      var result = await _userLocalDataSource.deleteCachedLogin();
      return Right(result);
    } on CachedLoginException {
      return Left(LogoutFailure());
    }
  }

}