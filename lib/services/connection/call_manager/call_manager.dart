import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Api call manager abstract class
class CallManager extends BaseCallManager<Future<Response>> {
  /// Initializes
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
    RequestCompareFunction comparePredicate,
  }) async =>
      addToChannel(request: request);
}
