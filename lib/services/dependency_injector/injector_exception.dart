/// Injector exception class
class InjectorException implements Exception {
  /// Class constructor
  InjectorException({this.message});

  /// Exception message
  String message;

  @override
  String toString() => 'Injector Exception: $message';
}
