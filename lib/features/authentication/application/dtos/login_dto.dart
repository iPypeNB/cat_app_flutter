import 'package:cat_app_flutter/features/authentication/application/dtos/base_dto.dart';
import 'package:cat_app_flutter/features/authentication/utils/constants/authentication_strings.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/base/password_value_object.dart';

final class LoginDto extends BaseDto {
  LoginDto.empty()
      : this(
          email: '',
          password: PasswordValueObject(''),
        );

  const LoginDto({
    required this.email,
    required this.password,
  });

  final String email;
  final PasswordValueObject password;

  LoginDto copyWith({
    String? email,
    PasswordValueObject? password,
  }) =>
      LoginDto(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  bool get isValid => email.isNotEmpty && password.isValid();

  String? get passwordError {
    return getErrorMessage(
      valueObject: password,
      notContainsLowerCaseLetterErrorMessage:
          AuthenticationStrings.I.passwordNotContainsLowerOrUpperCaseLetters,
      notContainsUpperCaseLetterErrorMessage:
          AuthenticationStrings.I.passwordNotContainsLowerOrUpperCaseLetters,
    );
  }

}
