import 'package:dartz/dartz.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:flutter_test_aldi_irsan_majid/core/error/failures.dart';
import 'package:flutter_test_aldi_irsan_majid/data/datasources/employee_local_datasource.dart';
import 'package:flutter_test_aldi_irsan_majid/data/models/user_model.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/repositories_contracts/employee_repository.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeLocalDatasource _employeeLocalDatasource;
  EmployeeRepositoryImpl(this._employeeLocalDatasource);

  @override
  Future<Either<Failure, bool>> createEmployee(User user) async {
    try{
      var isSuccess = await _employeeLocalDatasource.createEmployee(user);

      return Right(isSuccess);
    } on DatabaseOperationException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteEmployee(int id) async {
    try{
      var isSuccess = await _employeeLocalDatasource.deleteEmployee(id);
      return Right(isSuccess);
    } on DatabaseOperationException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, List<User>>> readAllEmployee() async {
    try{
      var employeeList = await _employeeLocalDatasource.readAllEmployee();
      if(employeeList.isNotEmpty) {
        return Right(employeeList);
      }
      return Left(DataNotFoundFailure());
    } on DatabaseOperationException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, User>> readOneEmployee(int id) async {
    try{
      var employeeList = await _employeeLocalDatasource.readOneEmployee(id);
      if(employeeList != null) {
        return Right(employeeList);
      }
      return Left(DataNotFoundFailure());
    } on DatabaseOperationException {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> updateEmployee(User user) async {
    try{
      var isSuccess = await _employeeLocalDatasource.createEmployee(user);
      return Right(isSuccess);
    } on DatabaseOperationException {
      return Left(DatabaseFailure());
    }
  }

}