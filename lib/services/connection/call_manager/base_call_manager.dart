import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/basic_binary_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/pending_request.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/subscription_stream.dart';

/// A predicate function to compare [request] and [pendingRequest]s
/// [equatableResult] indicates request and pending request are equal or not (by equatable package result)
typedef RequestCompareFunction = bool Function({
  Request request,
  PendingRequest<Response> pendingRequest,
  bool equatableResult,
});

/// Api call manager abstract class
abstract class BaseCallManager<T> {
  /// Class constructor
  BaseCallManager(this.api);

  /// Binary api instance
  final BasicBinaryAPI api;

  /// Pending requests queue
  final Map<int, PendingRequest<Response>> _pendingRequests =
      <int, PendingRequest<Response>>{};

  /// Store available request id
  int _requestId = 0;

  /// Get pending requests queue
  Map<int, PendingRequest<Response>> get pendingRequests => _pendingRequests;

  /// Indicates that pending request queue contain a request with [requestId] or not
  bool contains(int requestId) => _pendingRequests.containsKey(requestId);

  /// Calls a api method by [request]
  /// [comparePredicate] function is only applicable to subscription calls
  /// [comparePredicate] indicates compare condition for current [request] and [pendingRequest]s
  T call({
    @required Request request,
    RequestCompareFunction comparePredicate,
  });

  /// Handle call [response] that comes from server
  void handleResponse({
    @required int requestId,
    @required Map<String, dynamic> response,
  });

  /// Add [request] to pending requests queue, api history and web socket channel
  Future<Response> addToChannel({
    @required Request request,
    SubscriptionStream<Response> subscriptionStream,
  }) {
    final Completer<Response> responseCompleter = Completer<Response>();
    final Request requestWithId = request.copyWith(reqId: _getRequestId());
    final Map<String, dynamic> prepareRequest = _prepareRequest(
      request: requestWithId,
      isSubscription: subscriptionStream != null,
    );

    _addPendingRequest(
      request: requestWithId,
      responseCompleter: responseCompleter,
      subscriptionStream: subscriptionStream,
    );

    api.apiHistory.pushOutgoing(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      method: requestWithId.msgType,
      message: prepareRequest,
    );

    api.webSocketChannel.sink.add(
      utf8.encode(jsonEncode(prepareRequest)),
    );

    return responseCompleter.future;
  }

  /// Add [request] to pending requests queue
  void _addPendingRequest({
    @required Request request,
    @required Completer<Response> responseCompleter,
    SubscriptionStream<Response> subscriptionStream,
  }) =>
      _pendingRequests[request.reqId] = PendingRequest<Response>(
        request: request,
        responseCompleter: responseCompleter,
        subscriptionStream: subscriptionStream,
      );

  int _getRequestId() => _requestId++;

  Map<String, dynamic> _prepareRequest({
    Request request,
    bool isSubscription,
  }) {
    final Map<String, dynamic> result = request.toJson()
      ..removeWhere((String key, dynamic value) => value == null);

    if (isSubscription) {
      result.putIfAbsent('subscribe', () => 1);
    }

    return result;
  }
}
