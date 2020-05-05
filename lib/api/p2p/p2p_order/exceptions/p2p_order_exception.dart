import '../../../exceptions/api_base_exception.dart';

/// P2P Order exception class
class P2POrderException extends APIBaseException {
  /// Initializes
  P2POrderException({String message}) : super(message: message);
}
