import 'package:flutter_deriv_api/api/request.dart';

/// Api call manager abstract class
abstract class ApiCallManager<T> {
  /// Indicates that pending request queue contain a request with [requestId] or not
  bool contains(int requestId);

  /// Calls the api method
  T call(Request request);

  /// Handle call response
  void handleResponse({
    int requestId,
    Map<String, dynamic> response,
  });
}
