import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

import '../../core/resources/consts/db_keys/app_db_consts.dart';

class User extends UserEntity {
  const User(
      {super.id,
      super.name,
      super.email,
      super.address,
      super.gender,
      super.phoneNumber});

  User copyWith(
    int? id,
    String? name,
    String? email,
    String? address,
    String? phoneNumber,
    String? gender,
  ) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
    );
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      userName: name,
      userEmail: email,
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
      name: map[userId].toString(),
      email: map[userEmail].toString(),
      address: map[userAddress].toString(),
      phoneNumber: map[userPhone].toString(),
      gender: map[userGender].toString(),
    );
  }
}
