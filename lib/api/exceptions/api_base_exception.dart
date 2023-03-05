import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// Base exception class
class APIBaseException implements Exception {
  /// Initializes
  APIBaseException({
    required this.baseExceptionModel,
  });

  /// Exception code
  final BaseExceptionModel? baseExceptionModel;

  /// The exception's message
  String? get message => baseExceptionModel!.message;

  /// The exception's code
  String? get code => baseExceptionModel!.code;

  /// The exception's details.
  Map<String, dynamic>? get details => baseExceptionModel!.details;

  @override
  String toString() =>
      message ??
      '$runtimeType(code: ${baseExceptionModel!.code}, message: ${baseExceptionModel!.message})';
}
