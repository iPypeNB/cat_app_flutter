import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:flutter/material.dart';

final class RegularExpressionFailure implements Failure {
  final String? message;

  const RegularExpressionFailure([this.message]);

  @override
  void logging() {
    debugPrint('RegularExpressionFailure: $message');
  }
}

final class NotContainsUpperCaseLetters extends RegularExpressionFailure {
  const NotContainsUpperCaseLetters([super.message]);
}

final class NotContainsLowerCaseLetters extends RegularExpressionFailure {
  const NotContainsLowerCaseLetters([super.message]);
}

