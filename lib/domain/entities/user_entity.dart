import 'package:equatable/equatable.dart';

abstract class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? address;
  final String? phoneNumber;
  final String? gender;
  const UserEntity({
    this.id,
    this.name,
    this.email,
    this.password,
    this.address,
    this.phoneNumber,
    this.gender,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        password,
        address,
        phoneNumber,
        gender,
      ];
}
