import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/p2p/exceptions/p2p_exception.dart';

/// P2P Order exception class
class P2POrderException extends P2PException {
  /// Initializes
  P2POrderException({
    BaseExceptionModel baseExceptionModel,
  }) : super(baseExceptionModel: baseExceptionModel);
}
