part of '../helpers.dart';

/// Parses the [url] and gets the endpoint out of it
String parseWebSocketUrl(String url, {bool isAuthUrl = false}) {
  if (url == null) {
    return null;
  }

  String result = url;
  final RegExp qaRegx = RegExp('^(qa[0-9]{2})\$', caseSensitive: false);
  final RegExp derivRegx =
      RegExp('((binary|deriv)ws\.(com|app))\$', caseSensitive: false);

  if (qaRegx.hasMatch(result)) {
    result = 'www.binary$result.com';
  }

  if (isAuthUrl && derivRegx.hasMatch(result)) {
    result = derivRegx.stringMatch(result);
  }

  return result;
}

/// Checks for existence of error in [response] and throws exception created by [exceptionCreator]
void checkException({
  Response response,
  APIBaseException Function({BaseExceptionModel baseExceptionModel})
      exceptionCreator,
}) {
  if (response?.error != null) {
    throw exceptionCreator(
      baseExceptionModel: BaseExceptionModel(
        code: response.error['code'],
        message: response.error['message'],
        details: response.error['details'],
      ),
    );
  }
}
