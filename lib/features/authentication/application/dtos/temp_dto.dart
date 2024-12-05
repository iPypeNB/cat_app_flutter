import 'package:cat_app_flutter/features/authentication/utils/constants/authentication_strings.dart';
import 'package:cat_app_flutter/shared/application/dtos/base_dto.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/password_value_object.dart';

final class TempDto extends BaseDto {
  const TempDto({
    required this.email,
    required this.password,
  });

  TempDto.empty() : this(
      email: '',
      password: PasswordValueObject('')
  );

  final String email;
  final PasswordValueObject password;

  TempDto copyWith({
    String? email,
    PasswordValueObject? password,
  }) =>
      TempDto(
        email: email ?? this.email,
        password: password ?? this.password,
      );

  String? get passwordError {
    return getErrorMessage(valueObject: password,
      notContainsUpperCaseLetterErrorMessage: AuthenticationStrings.I
          .passwordNotContainsLowerOrUpperCaseLetters,
      notContainsLowerCaseLetterErrorMessage: AuthenticationStrings.I
          .passwordNotContainsLowerOrUpperCaseLetters,
    );
  }
}
