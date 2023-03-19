
import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:flutter_test_aldi_irsan_majid/core/resources/consts/db_keys/app_db_consts.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user_model.dart';

abstract class EmployeeLocalDatasource {
    Future<bool> createEmployee(User user);
    Future<List<User>> readAllEmployee();
    Future<User?> readOneEmployee(int id);
    Future<bool> updateEmployee(User user);
    Future<bool> deleteEmployee(int id);
}

class EmployeeLocalDatasourceImpl extends EmployeeLocalDatasource {
    Database appDB;
    EmployeeLocalDatasourceImpl(this.appDB);
  @override
  Future<bool> createEmployee(User user) async{
    var id = await appDB.insert(userTable, user.toMap());
    if(id == 0){
      throw DatabaseOperationException();
    }
    return true;
  }

  @override
  Future<bool> deleteEmployee(int id) async {
    var deletedRows = await appDB.delete(userTable, where: '$userId = ?', whereArgs: [id]);
    if(deletedRows == 0){
      throw DatabaseOperationException();
    }
    return true;
  }

  @override
  Future<List<User>> readAllEmployee() async {
    try{
      List<Map> maps = await appDB.query(userTable,
        columns: allUserColumns,
      );
      if (maps.length > 0) {
        List<User> listOfEmployees = maps.map((e) => User.fromMap((e as Map<String, Object?>))).toList();
        return listOfEmployees;
      }
      return <User>[];
    } on DatabaseException {
      throw DatabaseOperationException();
    }

  }

  @override
  Future<User?> readOneEmployee(int id) async {
    List<Map> maps = await appDB.query(userTable,
      columns: allUserColumns,
      where: '$userId = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (maps.isNotEmpty) {
      return User.fromMap((maps.first as Map<String, Object?>));
    }
    return null;
  }

  @override
  Future<bool> updateEmployee(User user) async {
    var updateRows = await appDB.update(userTable, user.toMap(),
        where: '$userId = ?', whereArgs: [user.id]);
    if(updateRows == 0){
      throw DatabaseOperationException();
    }
    return true;
  }
}