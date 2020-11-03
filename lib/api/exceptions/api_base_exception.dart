import 'package:flutter/foundation.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Base exception class
class APIBaseException implements Exception {
  /// Initializes
  APIBaseException({
    @required this.baseExceptionModel,
  });

  /// Exception code
  final BaseExceptionModel baseExceptionModel;

  @override
  String toString() =>
      '$runtimeType(code: ${baseExceptionModel.code}, message: ${baseExceptionModel.message})';
}
