/// Api call manager abstract class
abstract class ApiCallManager {
  /// Indicates that pending request queue contain a request with [requestId] or not
  bool contains(int requestId);

  /// Handle call response
  void handleResponse({
    int requestId,
    Map<String, dynamic> response,
  });
}
