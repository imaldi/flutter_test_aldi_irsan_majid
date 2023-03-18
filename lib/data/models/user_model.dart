import 'package:flutter_test_aldi_irsan_majid/domain/entities/user_entity.dart';

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
}
