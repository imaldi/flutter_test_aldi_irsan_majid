import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

import '../../core/resources/consts/db_keys/app_db_consts.dart';

class User extends UserEntity {
  const User(
      {super.id,
      super.name,
      super.email,
      super.password,
      super.address,
      super.gender,
      super.phoneNumber});

  User copyWith(
    int? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? phoneNumber,
    String? gender,
  ) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: email ?? this.password,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
    );
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      userName: name,
      userEmail: email,
      userPassword: password,
      userAddress: address,
      userPhone: phoneNumber,
      userGender: gender,
    };
    if (id != null) {
      map[userId] = id;
    }
    return map;
  }

  factory User.fromMap(Map<String, Object?> map) {
    return User(
      id: (map[userId] as int),
      name: map[userName].toString(),
      email: map[userEmail].toString(),
      password: map[userPassword].toString(),
      address: map[userAddress].toString(),
      phoneNumber: map[userPhone].toString(),
      gender: map[userGender].toString(),
    );
  }
}
