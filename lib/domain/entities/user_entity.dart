import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  int? id;
  String? name;
  String? email;
  String? address;
  String? phoneNumber;
  String? gender;

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    address,
    phoneNumber,
    gender,
  ];
}