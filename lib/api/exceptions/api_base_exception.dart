import 'package:flutter/foundation.dart';

/// Base exception class
class APIBaseException implements Exception {
  /// Initializes
  APIBaseException({
    @required this.code,
    @required this.message,
    this.field,
  });

  /// Exception code
  final String code;

  /// Exception message
  final String message;

  /// Exception details field
  final String field;

  @override
  String toString() => '$runtimeType(code: $code, message: $message)';
}
