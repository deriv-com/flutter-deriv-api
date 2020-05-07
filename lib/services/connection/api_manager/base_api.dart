import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Base api abstract class
abstract class BaseAPI {
  /// Calls a api method by [request]
  Future<Response> call({@required Request request});

  /// Subscribe to a [request]
  /// [comparePredicate] indicates compare condition for current [request] and [pendingRequest]s
  Stream<Response> subscribe({
    @required Request request,
    RequestCompareFunction comparePredicate,
  });

  /// Close api
  Future<void> close();
}
