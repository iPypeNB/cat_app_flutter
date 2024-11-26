import 'package:cat_app_flutter/shared/domain/value_objects/base/password_value_object.dart';

class UserEntity {
  const UserEntity({
    required this.email,
    required this.birthdate,
    required this.phone,
    required this.password,
    this.name,
  });

  final String email;
  final String? name;
  final DateTime birthdate;
  final String phone;
  final PasswordValueObject password;
}
