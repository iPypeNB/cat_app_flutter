import 'package:cat_app_flutter/features/authentication/domain/entities/user_entity.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/base/password_value_object.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.birthdate,
    required super.phone,
    required this.id,
    required super.password,
    super.name,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        email: json[_emailCodingKey],
        birthdate: DateTime.parse(json[_birthdateCodingKey]),
        phone: json[_phoneCodingKey],
        id: json[_idCodingKey],
        name: json[_nameCodingKey],
        password: PasswordValueObject(json[_passwordCodingKey]),
      );

  Map<String, dynamic> toMap() => {
        _idCodingKey: id,
        _emailCodingKey: email,
        _birthdateCodingKey: birthdate,
        _phoneCodingKey: phone,
        _nameCodingKey: name,
        _passwordCodingKey: password
      };

  final String id;

  // coding keys
  static const String _idCodingKey = 'id';
  static const String _phoneCodingKey = 'phone';
  static const String _emailCodingKey = 'email';
  static const String _birthdateCodingKey = 'birthdate';
  static const String _nameCodingKey = 'name';
  static const String _passwordCodingKey = 'password';
}
