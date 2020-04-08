import 'dart:async';
import 'dart:convert';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/request.dart';
import 'package:flutter_deriv_api/api/response.dart';
import 'package:flutter_deriv_api/api/api.helper.dart';
import 'package:flutter_deriv_api/api/forget_send.dart';
import 'package:flutter_deriv_api/api/forget_receive.dart';
import 'package:flutter_deriv_api/api/forget_all_send.dart';
import 'package:flutter_deriv_api/api/forget_all_receive.dart';
import 'package:flutter_deriv_api/connection/subscription_stream.dart';
import 'package:flutter_deriv_api/connection/connection_websocket.dart';
import 'package:flutter_deriv_api/connection/pending_subscribe_request.dart';

/// Subscription manager class
class SubscriptionManager {
  /// Singleton instance
  factory SubscriptionManager({BinaryApi api}) {
    _instance._api = api;

    return _instance;
  }

  SubscriptionManager._();

  static final SubscriptionManager _instance = SubscriptionManager._();

  BinaryApi _api;
  int _lastRequestId = 0;

  final Map<int, PendingSubscribeRequest<Response>> _pendingRequests =
      <int, PendingSubscribeRequest<Response>>{};

  /// Indicates that pending request queue contain a request with [requestId] or not
  bool contains(int requestId) => _pendingRequests.containsKey(requestId);

  /// Get request response
  Completer<Response> getResponse(int requestId) =>
      _pendingRequests[requestId].response;

  /// Get subscription id
  String getSubscriptionId(int requestId) =>
      _pendingRequests[requestId]?.subscriptionId;

  /// Get subscription stream
  SubscriptionStream<Response> getSubscriptionStream(int requestId) =>
      _pendingRequests[requestId]?.subscriptionStream;

  /// Set subscription id
  void setSubscriptionId({
    int requestId,
    String subscriptionId,
  }) =>
      _pendingRequests[requestId] = PendingSubscribeRequest<Response>()
          .copyWith(subscriptionId: subscriptionId);

  /// Set subscription stream
  void setSubscriptionStream({
    int requestId,
    SubscriptionStream<Response> subscriptionStream,
  }) =>
      _pendingRequests[requestId] = PendingSubscribeRequest<Response>()
          .copyWith(subscriptionStream: subscriptionStream);

  /// Handle stream response
  void handleResponse({
    int requestId,
    Map<String, dynamic> response,
  }) {
    print('completing request for $requestId.');

    final Response resultResponse = getResponseByMsgType(response);
    final Completer<Response> requestCompleter = getResponse(requestId);

    if (!requestCompleter.isCompleted) {
      requestCompleter.complete(resultResponse);
    }

    // Adds the subscription id to the pendingRequest object for further references.
    if (response.containsKey('subscription')) {
      setSubscriptionId(
        requestId: requestId,
        subscriptionId: response['subscription']['id'],
      );
    }

    // Broadcasts the new message into the stream.
    getSubscriptionStream(requestId).add(resultResponse);

    print('response added to stream.');
  }

  /// Calls the API method with subscribe set to '1' and return the stream
  /// to caller for responses
  Stream<Response> subscribe(Request request) {
    // TODO(hamed): we should check request duplication before another api call

    final SubscriptionStream<Response> subscriptionStream =
        SubscriptionStream<Response>();

    request.reqId = _getLastRequestId();

    _call(request);

    _pendingRequests[request.reqId] = PendingSubscribeRequest<Response>()
        .copyWith(subscriptionStream: subscriptionStream);

    return subscriptionStream.stream;
  }

  /// unsubscribe with a specific [subscriptionId]
  Future<ForgetResponse> unsubscribe(
    String subscriptionId, {
    bool shouldForced = false,
  }) async {
    final int requestId = _pendingRequests.keys
        .singleWhere((int id) => getSubscriptionId(id) == subscriptionId);

    if (getSubscriptionStream(requestId).hasListener && !shouldForced) {
      throw Exception('The stream has listener');
    }

    // Send forget request
    final Response response = await _call(
      ForgetRequest(forget: getSubscriptionId(requestId)),
    );

    if (response.error == null) {
      await _removePendingRequest(requestId);
    }

    return response;
  }

  /// Unsubscribe to multiple [method]s all at once
  Future<dynamic> unsubscribeAll(
    String method, {
    bool shouldForced = false,
  }) async {
    final List<int> requestIds = _pendingRequests.keys.where(
      (int id) =>
          _pendingRequests[id].method == method &&
          _pendingRequests[id].isSubscribed,
    );

    final ForgetAllResponse response =
        await _call(ForgetAllRequest(forgetAll: method));

    if (response.error == null) {
      for (int id in requestIds) {
        await _removePendingRequest(id);
      }
    }

    return response;
  }

  /// Add a request to pending request queue
  void _add({
    @required int requestId,
    @required Map<String, dynamic> request,
    @required Completer<Response> response,
  }) =>
      _pendingRequests[requestId] = PendingSubscribeRequest<Response>(
        request: request,
        response: response,
      );

  /// Calls the web socket api with the given method name and parameters
  Future<Response> _call(Request request) {
    final Completer<Response> response = Completer<Response>();
    final Map<String, dynamic> preparedRequest = request.toJson()
      ..removeWhere((String key, dynamic value) => value == null)
      ..putIfAbsent('subscribe', () => 1);

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

  Future<void> _removePendingRequest(int requestId) async {
    await getSubscriptionStream(requestId).closeStream();
    _pendingRequests.remove(requestId);
  }

  int _getLastRequestId() => _lastRequestId++;
}
