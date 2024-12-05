import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:cat_app_flutter/core/exceptions/regular_expression_failure.dart';
import 'package:cat_app_flutter/core/utils/constants/core_constants.dart';
import 'package:cat_app_flutter/core/utils/validators/validator.dart';

final class MinimumCharactersPasswordValidator implements Validator<String> {
  @override
  Failure? validate({required String input}) {
    if (input.length < CoreConstants.minimumLengthPassword) {
      return const NotContainsMinimumCharacters();
    }

    return null;
  }
}
