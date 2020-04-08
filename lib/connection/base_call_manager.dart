import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/api.helper.dart';
import 'package:flutter_deriv_api/connection/pending_request.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';
import 'package:flutter_deriv_api/connection/pending_subscribed_request.dart';

/// Api call manager abstract class
abstract class BaseCallManager<T> {
  /// Class constructor
  BaseCallManager(this.api);

  /// Binary api instance
  final BinaryAPI api;

  int _lastRequestId = 0;

  /// Pending requests queue
  final Map<int, PendingRequest<Response>> _pendingRequests =
      <int, PendingRequest<Response>>{};

  /// Returns available request id
  int get nextRequestId => _lastRequestId++;

  /// Get pending requests queue
  Map<int, PendingRequest<Response>> get pendingRequests => _pendingRequests;

  /// Indicates that pending request queue contain a request with [requestId] or not
  bool contains(int requestId) => _pendingRequests.containsKey(requestId);

  /// Indicates that is subscription manager or not
  bool isSubscription(int requestId) =>
      _pendingRequests[requestId] is PendingSubscribedRequest;

  /// Calls the api method
  T call(Request request);

  /// Handle call response
  void handleResponse({
    @required int requestId,
    @required Map<String, dynamic> response,
  }) {
    print('completing request for $requestId.');

    final Completer<Response> requestCompleter = _getResponse(requestId);

    if (!requestCompleter.isCompleted) {
      requestCompleter.complete(getResponseByMsgType(response));
    }
  }

  /// Add request to pending requests queue, api history and channel sink
  Future<Response> prepareRequest({
    @required int requestId,
    @required Map<String, dynamic> request,
  }) {
    final Completer<Response> response = Completer<Response>();

    _addPendingRequest(
      requestId: requestId,
      request: request,
      response: response,
    );

    api.apiHistory.pushOutgoing(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      message: request,
      method: 'method',
    );

    api.webSocketChannel.sink.add(
      utf8.encode(jsonEncode(request)),
    );

    return response.future;
  }

  /// Get pending request response
  Completer<Response> _getResponse(int requestId) =>
      pendingRequests[requestId].response;

  /// Add pending request to pending requests queue
  void _addPendingRequest({
    int requestId,
    Map<String, dynamic> request,
    Completer<Response> response,
  }) =>
      _pendingRequests[requestId] = PendingRequest<Response>(
        request: request,
        response: response,
      );
}
