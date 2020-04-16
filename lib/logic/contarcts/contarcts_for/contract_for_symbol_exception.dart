/// Exception for contract for symbol request call
class ContractsForSymbolException implements Exception {
  /// Class constructor
  ContractsForSymbolException({
    this.message,
  });

  /// Exception message
  String message;

  @override
  String toString() => 'Contracts for symbol exception: $message';
}