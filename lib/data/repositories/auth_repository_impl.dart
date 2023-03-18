import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/data/datasources/auth_local_datasource.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/auth_repository.dart';

import '../models/user_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  AuthRepositoryImpl(this._authLocalDataSource);
  @override
  Future<Either<Failure, bool>> login(User user) async {
    try{
      var result = await _authLocalDataSource.authLogin(user);
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
      var result = await _authLocalDataSource.authRegister(user);
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
      var result = await _authLocalDataSource.getCachedLogin();
      return Right(result);
    } on CachedLoginException {
      return Left(CachedLoginFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try{
      var result = await _authLocalDataSource.deleteCachedLogin();
      return Right(result);
    } on CachedLoginException {
      return Left(LogoutFailure());
    }
  }

}