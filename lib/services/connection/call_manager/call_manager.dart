import 'dart:async';

import 'package:flutter_deriv_api/basic_api/helper/response_mapper.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Api call manager abstract class
class CallManager extends BaseCallManager<Future<Response>> {
  /// Initializes
  CallManager(BaseAPI api) : super(api);

  @override
  void handleResponse({
    required int requestId,
    required Map<String, dynamic> response,
  }) {
    super.handleResponse(requestId: requestId, response: response);

    final Completer<Response>? responseCompleter =
        pendingRequests[requestId]?.responseCompleter;

    if (responseCompleter?.isCompleted == false) {
      responseCompleter!.complete(getResponseByMsgType(response));
    }

    pendingRequests.remove(requestId);
  }

  @override
  Future<Response> call({required Request request}) async =>
      addToChannel(request: request);
}
