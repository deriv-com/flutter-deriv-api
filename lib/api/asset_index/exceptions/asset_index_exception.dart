import '../../exceptions/api_base_exception.dart';

/// Exception class for asset index
class AssetIndexException extends APIBaseException {
  /// Initializes
  AssetIndexException({String message}) : super(message: message);
}
