import '../../exceptions/api_base_exception.dart';

/// Exception class for website status
class WebsiteStatusException extends APIBaseException {
  /// Initializes
  WebsiteStatusException({String message}) : super(message: message);
}
