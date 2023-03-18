import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

import '../models/user_model.dart';

abstract class UserLocalDataSource {
  Future<bool> userLogin(User userEntity);
  Future<bool> userRegister(User userEntity);
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  @override
  Future<bool> userLogin(User user) {
    bool? loginSuccess;
    if(loginSuccess ?? false){
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
}