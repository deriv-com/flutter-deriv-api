/// Exception for active symbols request call
class ActiveSymbolsException implements Exception {
  /// Class constructor
  ActiveSymbolsException({
    this.message,
  });

  /// Exception message
  String message;

  @override
  String toString() => 'Active Symbols Exception: $message';
}