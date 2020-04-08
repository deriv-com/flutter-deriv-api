import 'dart:async';

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/connection/base_call_manager.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// Api call manager abstract class
class CallManager extends BaseCallManager<Future<Response>> {
  /// Class constructor
  CallManager(BinaryAPI api) : super(api);

  @override
  void handleResponse({
    int requestId,
    Map<String, dynamic> response,
  }) {
    super.handleResponse(requestId: requestId, response: response);

    pendingRequests.remove(requestId);

    print('completed request.');
  }

  @override
  Future<Response> call(Request request) async {
    request.reqId = nextRequestId;

    final Map<String, dynamic> preparedRequest = request.toJson()
      ..removeWhere((String key, dynamic value) => value == null);

    return prepareRequest(
      requestId: request.reqId,
      request: preparedRequest,
    );
  }
}
