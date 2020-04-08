import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/api.helper.dart';
import 'package:flutter_deriv_api/api/authorize_send.dart';
import 'package:flutter_deriv_api/connection/pending_request.dart';
import 'package:flutter_deriv_api/connection/api_call_manager.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';

/// Call manager class
class CallManager extends ApiCallManager {
  /// Singleton instance
  factory CallManager({BinaryApi api}) {
    _instance._api = api;

    return _instance;
  }

  CallManager._();

  static final CallManager _instance = CallManager._();

  BinaryApi _api;
  int _lastRequestId = 0;

  final Map<int, PendingRequest<Response>> _pendingRequests =
      <int, PendingRequest<Response>>{};

  @override
  bool contains(int requestId) => _pendingRequests.containsKey(requestId);

  @override
  void handleResponse({
    int requestId,
    Map<String, dynamic> response,
  }) {
    print('completing request for $requestId.');

    final Completer<Response> requestCompleter =
        _pendingRequests[requestId].response;

    if (!requestCompleter.isCompleted) {
      requestCompleter.complete(getResponseByMsgType(response));
    }

    // Removes the pendingRequest when it's not a subscription, the subscription requests will be remove after unsubscribing.
    _pendingRequests.remove(requestId);

    print('completed request.');
  }

  /// Calls the api method
  Future<Response> call(Request request) async {
    request.reqId = _getLastRequestId();

    return _call(request);
  }

  /// Calls the authorize method with the giver [token]
  Future<Response> authorize(String token) async {
    Response authResponse;

    try {
      final AuthorizeRequest authorizeRequest = AuthorizeRequest()
        ..authorize = token;

      print('auth request is ${authorizeRequest.toJson()}.');

      authResponse = await _call(authorizeRequest);

      print('auth response is $authResponse.');
    } on Exception catch (e) {
      print(e);

      throw Exception(e);
    }

    return authResponse;
  }

  void _add({
    @required int requestId,
    @required Map<String, dynamic> request,
    @required Completer<Response> response,
  }) =>
      _pendingRequests[requestId] = PendingRequest<Response>(
        request: request,
        response: response,
      );

  /// Calls the web socket api with the given method name and parameters
  Future<Response> _call(Request request) {
    final Completer<Response> response = Completer<Response>();
    final Map<String, dynamic> preparedRequest = request.toJson()
      ..removeWhere((String key, dynamic value) => value == null);

    _add(
      requestId: request.reqId,
      request: preparedRequest,
      response: response,
    );

    _api.apiHistory.pushOutgoing(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      message: preparedRequest,
      method: 'method',
    );

    _api.webSocketChannel.sink.add(
      utf8.encode(jsonEncode(preparedRequest)),
    );

    return response.future;
  }

  int _getLastRequestId() => _lastRequestId++;
}
