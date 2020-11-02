import 'package:flutter_deriv_api/api/exceptions/api_base_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';

/// P2P exception
class P2PException extends APIBaseException {
  /// Initializes
  P2PException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}