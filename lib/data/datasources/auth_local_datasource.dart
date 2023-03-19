import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/resources/consts/db_keys/app_db_consts.dart';
import '../../core/resources/consts/shared_pref_keys/user_consts.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<bool> authLogin(User user);
  Future<bool> authRegister(User user);
  Future<bool> getCachedLogin();
  Future<bool> deleteCachedLogin();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final Database db;
  AuthLocalDataSourceImpl(this.db);
  @override
  Future<bool> authLogin(User user) async {
    bool? loginSuccess;
    List<Map> maps = await db.query(userTable,
      columns: allUserColumns,
      where: '$userEmail = ? and $userPassword = ?',
      whereArgs: [user.email ?? "", user.password ?? ""],
      limit: 1,
    );
    loginSuccess = maps.isNotEmpty;
    if(loginSuccess){
      _cacheLoginResponse(true);
      return Future.value(true);
    } else {
      throw LoginException();
    }
  }

  @override
  Future<bool> authRegister(User user) async {
    try{
    var id = await db.insert(userTable, user.toMap());
    if(id == 0){
      throw DatabaseOperationException();
    }
    return true;

    } on DatabaseException {
      throw RegisterException();
    }
  }

  Future<void> _cacheLoginResponse(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();

    var succesSaveLoginStatus = await prefs.setBool(isUserLogin, true);

    if(!succesSaveLoginStatus){
      throw CachedLoginException();
    }
  }

  @override
  Future<bool> deleteCachedLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(isUserLogin);
  }

  @override
  Future<bool> getCachedLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isUserLogin) ?? false;
  }
}