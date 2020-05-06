import 'package:flutter_deriv_api/api/account/exceptions/account_exception.dart';

/// Exception for portfolio
class PortfolioException extends AccountException {
  /// Initializes
  PortfolioException({String message}) : super(message: message);
}
