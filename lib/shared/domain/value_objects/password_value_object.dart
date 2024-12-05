import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/core/utils/validators/minimum_characters_password.dart';
import 'package:cat_app_flutter/core/utils/validators/minimum_lower_upper_letters.dart';
import 'package:cat_app_flutter/core/utils/validators/validator.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/base/value_object.dart';
import 'package:dartz/dartz.dart';

final class PasswordValueObject extends ValueObject<String> {

  factory PasswordValueObject(String value) {
    return PasswordValueObject._(PasswordValueObject.validate(value));
  }

  const PasswordValueObject._(super.value);

  static Either<Failure, String> validate(String value) {
    final List<Validator<String>> validators = [
      MinimumLowerUpperLetterValidator(),
      MinimumCharactersPasswordValidator(),
    ];
    return ValueObject.executeValidators(value: value, validators: validators);
  }

}
