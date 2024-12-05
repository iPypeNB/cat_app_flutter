import 'package:cat_app_flutter/core/exceptions/regular_expression_failure.dart';
import 'package:cat_app_flutter/shared/domain/value_objects/password_value_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PasswordValueObject inputs test', () {
    test('When password not contains upper case value Should be Failure', () {
      // Arrange
      const input = 'contrast';

      // Act
      final PasswordValueObject password = PasswordValueObject(input);
      final value = password.error;

      // assert
      expect(value, isA<NotContainsUpperCaseLetters>());
    });

    test('When password not contains lower case value Should be Failure', () {
      // Arrange
      const input = 'CONTRASEÑA';

      // Act
      final PasswordValueObject password = PasswordValueObject(input);
      final value = password.error;

      // assert
      expect(value, isA<NotContainsLowerCaseLetters>());
    });

    test('When password minimum 12 length Should be Failure', () {
      // Arrange
      const input = 'Cn1234567';

      // Act
      final PasswordValueObject password = PasswordValueObject(input);
      final value = password.error;

      // assert
      expect(value, isA<NotContainsMinimumCharacters>());
    });
  });
}
