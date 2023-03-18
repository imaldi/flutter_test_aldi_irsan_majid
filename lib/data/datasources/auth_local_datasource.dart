import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/resources/consts/shared_pref_keys/user_consts.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<bool> authLogin(User user);
  Future<bool> authRegister(User user);
  Future<bool> getCachedLogin();
  Future<bool> deleteCachedLogin();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  @override
  Future<bool> authLogin(User user) {
    bool? loginSuccess;
    if(loginSuccess ?? false){
      _cacheLoginResponse(loginSuccess ?? false);
      return Future.value(true);
    } else {
      throw LoginException();
    }
  }

  @override
  Future<bool> authRegister(User user) {
    bool? registerSuccess;
    if(registerSuccess ?? false){
      return Future.value(true);
    } else {
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