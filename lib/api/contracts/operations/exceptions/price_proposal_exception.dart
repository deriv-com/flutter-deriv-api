import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';

/// Exception for price proposal request calls
class PriceProposalException extends APIBaseException {
  /// Initializes
  PriceProposalException({String message}) : super(message: message);

  @override
  String get message =>
      '${PriceProposalException().runtimeType} Exception: $message';
}
