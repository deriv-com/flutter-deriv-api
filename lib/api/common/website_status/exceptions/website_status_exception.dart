import 'package:flutter_deriv_api/api/common/exceptions/common_exception.dart';

/// Exception class for website status
class WebsiteStatusException extends CommonException {
  /// Initializes
  WebsiteStatusException({String message}) : super(message: message);
}
