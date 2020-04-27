import '../../exceptions/api_base_exception.dart';

/// Exception for residence calls
class ResidenceException extends APIBaseException {
  /// Initializes
  ResidenceException({String message}) : super(message: message);
}
