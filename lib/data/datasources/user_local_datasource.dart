import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<bool> userLogin(User user);
  Future<bool> userRegister(User user);
  Future<bool> getCachedLogin();
  Future<void> _cacheLoginResponse(bool isLoggedIn);
  Future<bool> deleteCachedLogin();
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  @override
  Future<bool> userLogin(User user) {
    bool? loginSuccess;
    if(loginSuccess ?? false){
      _cacheLoginResponse(loginSuccess ?? false);
      return Future.value(true);
    } else {
      throw LoginException();
    }
  }

  @override
  Future<bool> userRegister(User user) {
    bool? registerSuccess;
    if(registerSuccess ?? false){
      return Future.value(true);
    } else {
      throw RegisterException();
    }
  }

  @override
  Future<void> _cacheLoginResponse(bool isLoggedIn) {
    // TODO: implement cacheLoginResponse
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteCachedLogin() {
    // TODO: implement deleteCachedLogin
    throw UnimplementedError();
  }

  @override
  Future<bool> getCachedLogin() {
    // TODO: implement getCachedLogin
    throw UnimplementedError();
  }
}