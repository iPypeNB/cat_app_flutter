import 'package:cat_app_flutter/core/exceptions/failure.dart';
import 'package:flutter/material.dart';

class ServerFailure implements Failure {
  const ServerFailure([this.message = '']);

  final String message;

  @override
  void logging() {
    debugPrint('ServerFailure: $message');
  }
}
