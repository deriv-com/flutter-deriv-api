import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exception class for asset index
class AssetIndexException extends CommonException {
  /// Initializes
  AssetIndexException({
    String code,
    String message,
  }) : super(code: code, message: message);
}
