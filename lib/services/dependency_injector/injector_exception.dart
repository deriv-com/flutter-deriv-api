/// Injector exception class
class InjectorException implements Exception {
  /// Initializes
  InjectorException({this.message});

  /// Exception message
  String message;

  @override
  String toString() => 'Injector Exception: $message';
}
