import '../models/user_model.dart';

abstract class EmployeeLocalDatasource {
    Future<bool> createEmployee(User user);
    Future<List<User>> readAllEmployee();
    Future<User> readOneEmployee(int id);
    Future<bool> updateEmployee(User user);
    Future<bool> deleteEmployee(int id);
}

class EmployeeLocalDatasourceImpl extends EmployeeLocalDatasource {
    // TODO implement sqflite here
  @override
  Future<bool> createEmployee(User user) {
    // TODO: implement createEmployee
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteEmployee(int id) {
    // TODO: implement deleteEmployee
    throw UnimplementedError();
  }

  @override
  Future<List<User>> readAllEmployee() {
    // TODO: implement readAllEmployee
    throw UnimplementedError();
  }

  @override
  Future<User> readOneEmployee(int id) {
    // TODO: implement readOneEmployee
    throw UnimplementedError();
  }

  @override
  Future<bool> updateEmployee(User user) {
    // TODO: implement updateEmployee
    throw UnimplementedError();
  }
}