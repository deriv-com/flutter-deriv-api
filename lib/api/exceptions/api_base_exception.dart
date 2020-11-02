import 'package:flutter/foundation.dart';

/// Base exception class
class APIBaseException implements Exception {
  /// Initializes
  APIBaseException({
    @required this.code,
    @required this.message,
  });

  /// Exception code
  final String code;

  /// Exception message
  final String message;

  @override
  String toString() => '$runtimeType(code: $code, message: $message)';
}
