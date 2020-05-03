import '../../exceptions/api_base_exception.dart';

/// Ping exception class
class PingException extends APIBaseException {
  /// Initializes
  PingException({String message}) : super(message: message);
}
