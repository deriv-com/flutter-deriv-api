import 'dart:developer' as dev;

import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Base exception class for all API exceptions.
class BaseAPIException implements Exception {
  /// Initializes an exception with the given [baseExceptionModel].
  BaseAPIException({required this.baseExceptionModel});

  /// Exception code and message model from API response.
  final BaseExceptionModel? baseExceptionModel;

  /// The exception's message (if any).
  String? get message => baseExceptionModel?.message;

  /// The exception's code (if any).
  String? get code => baseExceptionModel?.code;

  /// The exception's details.
  Map<String, dynamic>? get details => baseExceptionModel?.details;

  @override
  String toString() {
    dev.log('$runtimeType(code: $code, message: $message)');

    return message ?? '$runtimeType: API unknown error.';
  }
}
