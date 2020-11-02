/// Base Exception model
class BaseExceptionModel {
  /// This model contains error [code], [message], and [details].
  BaseExceptionModel({
    this.code,
    this.message,
    this.details,
  });

  /// Error code.
  final String code;

  /// Error message.
  final String message;

  /// Error details.
  final Map<String, dynamic> details;
}