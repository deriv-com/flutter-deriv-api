import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/api.helper.dart';
import 'package:flutter_deriv_api/connection/pending_request.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// Api call manager abstract class
abstract class BaseCallManager<T> {
  /// Class constructor
  BaseCallManager(this.api);

  /// Binary api instance
  final BinaryAPI api;

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
  T call(Request request);

  /// Handle call [response] that comes from server
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

  /// Add [request] to pending requests queue, api history and web socket channel
  Future<Response> addToChannel({
    @required Request request,
    String absentKey,
    dynamic Function() absentFunction,
  }) {
    final Completer<Response> response = Completer<Response>();
    final Request requestWithId = request.copyWith(reqId: _getRequestId());
    final Map<String, dynamic> prepareRequest = _prepareRequest(requestWithId);

    if (absentFunction != null) {
      prepareRequest.putIfAbsent(absentKey, absentFunction);
    }

    _addPendingRequest(
      request: requestWithId,
      response: response,
    );

    api.apiHistory.pushOutgoing(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      message: prepareRequest,
      method: 'method',
    );

    api.webSocketChannel.sink.add(
      utf8.encode(jsonEncode(prepareRequest)),
    );

    return response.future;
  }

  /// Get pending request response by [requestId]
  Completer<Response> _getResponse(int requestId) =>
      pendingRequests[requestId].response;

  /// Add [request] to pending requests queue
  void _addPendingRequest({
    Request request,
    Completer<Response> response,
  }) =>
      _pendingRequests[request.reqId] = PendingRequest<Response>(
        request: request,
        response: response,
      );

  int _getRequestId() => _requestId++;

  Map<String, dynamic> _prepareRequest(Request request) => request.toJson()
    ..removeWhere((String key, dynamic value) => value == null);
}
