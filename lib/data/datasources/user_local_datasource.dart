import 'package:flutter_test_aldi_irsan_majid/core/error/exceptions.dart';
import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

abstract class UserLocalDataSource {
  Future<bool> userLogin(UserEntity userEntity);
  Future<bool> userRegister(UserEntity userEntity);
}

class UserLocalDataSourceImpl extends UserLocalDataSource {
  @override
  Future<bool> userLogin(UserEntity userEntity) {
    bool? loginSuccess;
    if(loginSuccess ?? false){
      return Future.value(true);
    } else {
      throw LoginException();
    }
  }

  @override
  Future<bool> userRegister(UserEntity userEntity) {
    bool? registerSuccess;
    if(registerSuccess ?? false){
      return Future.value(true);
    } else {
      throw RegisterException();
    }
  }
}