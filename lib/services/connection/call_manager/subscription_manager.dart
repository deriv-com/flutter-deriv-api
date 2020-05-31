import 'dart:async';
import 'package:meta/meta.dart';

import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.helper.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_send.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/pending_request.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/subscription_stream.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Subscription manager class
class SubscriptionManager extends BaseCallManager<Stream<Response>> {
  /// Initializes
  SubscriptionManager(BaseAPI api) : super(api);

  /// Get [subscriptionId] by [requestId]
  String getSubscriptionId(int requestId) =>
      pendingRequests[requestId]?.subscriptionId;

  /// Get [subscriptionStream] by [requestId]
  SubscriptionStream<Response> getSubscriptionStream(int requestId) =>
      pendingRequests[requestId]?.subscriptionStream;

  @override
  void handleResponse({
    @required int requestId,
    @required Map<String, dynamic> response,
  }) {
    super.handleResponse(requestId: requestId, response: response);

    // Adds the subscription id to the pending request object for further references
    if (response.containsKey('subscription')) {
      _setSubscriptionId(
        requestId: requestId,
        subscriptionId: response['subscription']['id'],
      );
    }

    // Broadcasts the new message into the stream
    getSubscriptionStream(requestId)?.add(getResponseByMsgType(response));
  }

  @override
  Stream<Response> call({
    @required Request request,
    RequestCompareFunction comparePredicate,
  }) {
    final PendingRequest<Response> pendingRequest = _getPendingRequest(
      request: request,
      pendingRequests: pendingRequests,
      comparePredicate: comparePredicate,
    );

    if (pendingRequest != null) {
      pendingRequests[pendingRequest.request.reqId] =
          _increaseListenerCount(pendingRequest);

      return pendingRequest.subscriptionStream.stream;
    }

    final SubscriptionStream<Response> subscriptionStream =
        SubscriptionStream<Response>();

    addToChannel(
      request: request,
      subscriptionStream: subscriptionStream,
    );

    return subscriptionStream.stream;
  }

  /// Unsubscribe with a specific [subscriptionId]
  Future<ForgetResponse> unsubscribe({
    @required String subscriptionId,
    bool onlyCurrentListener = true,
    bool shouldForced = false,
  }) async {
    final int requestId = pendingRequests.keys
        .singleWhere((int id) => getSubscriptionId(id) == subscriptionId);

    if (getSubscriptionStream(requestId).hasListener && !shouldForced) {
      throw Exception('The stream has listener');
    }

    if (onlyCurrentListener && pendingRequests[requestId].listenersCount > 1) {
      pendingRequests[requestId] = _decreaseListenerCount(
        pendingRequests[requestId],
      );

      return const ForgetResponse(forget: 1, msgType: 'forget');
    }

    // Send forget request
    final Response response = await api.call(
      request: ForgetRequest(forget: getSubscriptionId(requestId)),
    );

    if (response.error == null) {
      await _removePendingRequest(requestId);
    }

    return response;
  }

  /// Unsubscribe to multiple [method]s all at once
  Future<dynamic> unsubscribeAll({
    @required ForgetStreamType method,
    bool shouldForced = false,
  }) async {
    final String methodName = getStringFromEnum(method);

    final List<int> requestIds = pendingRequests.keys.where(
      (int id) {
        final PendingRequest<Response> pendingRequest = pendingRequests[id];

        return pendingRequest.request.msgType == methodName &&
            pendingRequest.isSubscribed;
      },
    );

    final ForgetAllResponse response = await api.call(
      request: ForgetAllRequest(forgetAll: methodName),
    );

    if (response.error == null) {
      for (int id in requestIds) {
        await _removePendingRequest(id);
      }
    }

    return response;
  }

  Future<void> _removePendingRequest(int requestId) async {
    await getSubscriptionStream(requestId).closeStream();

    pendingRequests.remove(requestId);
  }

  void _setSubscriptionId({
    @required int requestId,
    @required String subscriptionId,
  }) =>
      pendingRequests[requestId] =
          pendingRequests[requestId]?.copyWith(subscriptionId: subscriptionId);

  PendingRequest<Response> _getPendingRequest({
    @required Request request,
    @required Map<int, PendingRequest<Response>> pendingRequests,
    RequestCompareFunction comparePredicate,
  }) =>
      pendingRequests.values.firstWhere(
        (PendingRequest<Response> pendingRequest) {
          final bool equatableResult = request == pendingRequest.request;

          return comparePredicate == null
              ? equatableResult
              : comparePredicate(
                  request: request,
                  pendingRequest: pendingRequest,
                  equatableResult: equatableResult,
                );
        },
        orElse: () => null,
      );

  PendingRequest<Response> _increaseListenerCount(
    PendingRequest<Response> pendingRequest,
  ) =>
      pendingRequest.copyWith(
        listenersCount: pendingRequest.listenersCount + 1,
      );

  PendingRequest<Response> _decreaseListenerCount(
    PendingRequest<Response> pendingRequest,
  ) =>
      pendingRequest.copyWith(
        listenersCount: pendingRequest.listenersCount - 1,
      );
}
