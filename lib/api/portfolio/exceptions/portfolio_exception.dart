import '../../exceptions/api_base_exception.dart';

/// Exception for portfolio
class PortfolioException extends APIBaseException {
  /// Initializes
  PortfolioException({String message}) : super(message: message);
}
