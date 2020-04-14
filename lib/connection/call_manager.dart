import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/connection/base_call_manager.dart';

/// Api call manager abstract class
class CallManager extends BaseCallManager<Future<Response>> {
  /// Class constructor
  CallManager(BasicBinaryAPI api) : super(api);

  @override
  void handleResponse({
    @required int requestId,
    @required Map<String, dynamic> response,
  }) {
    super.handleResponse(requestId: requestId, response: response);

    pendingRequests.remove(requestId);

    print('completed request.');
  }

  @override
  Future<Response> call({
    @required Request request,
    RequestPredicateFunction predicate,
  }) async =>
      addToChannel(request: request);
}
