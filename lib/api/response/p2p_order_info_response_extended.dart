import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_cancel_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_confirm_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_info_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Extends [P2pOrderInfoResponse] with additional methods.
class P2pOrderInfoResponseExtended extends P2pOrderInfoResponse {
  /// Initializes a new instance of [P2pOrderInfoResponseExtended]
  P2pOrderInfoResponseExtended({
    super.p2pOrderInfo,
    super.subscription,
  });

  factory P2pOrderInfoResponseExtended._cast(P2pOrderInfoResponse response) =>
      P2pOrderInfoResponseExtended(
        p2pOrderInfo: response.p2pOrderInfo,
        subscription: response.subscription,
      );

  /// Creates an instance from JSON.
  factory P2pOrderInfoResponseExtended.fromJson(
    dynamic json,
    dynamic subscriptionJson,
  ) =>
      P2pOrderInfoResponseExtended._cast(
        P2pOrderInfoResponse.fromJson(json, subscriptionJson),
      );

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<P2pOrderInfoResponseExtended> fetchOrder(
      P2pOrderInfoRequest request) async {
    final P2pOrderInfoReceive response = await fetchOrderRaw(request);

    return P2pOrderInfoResponseExtended.fromJson(
      response.p2pOrderInfo,
      response.subscription,
    );
  }

  /// Gets order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<P2pOrderInfoReceive> fetchOrderRaw(
      P2pOrderInfoRequest request) async {
    final P2pOrderInfoReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Subscribes to this order.
  Stream<P2pOrderInfoResponse?> subscribe({
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeOrder(
        P2pOrderInfoRequest(id: p2pOrderInfo?.id),
        comparePredicate: comparePredicate,
      );

  /// Subscribes to this order.
  Stream<P2pOrderInfoReceive?> subscribeRaw({
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeOrderRaw(
        P2pOrderInfoRequest(id: p2pOrderInfo?.id),
        comparePredicate: comparePredicate,
      );

  /// Subscribes to order with parameters specified in [P2pOrderInfoRequest].
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  static Stream<P2pOrderInfoResponseExtended?> subscribeOrder(
    P2pOrderInfoRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeOrderRaw(
        request,
        comparePredicate: comparePredicate,
      ).map(
        (P2pOrderInfoReceive? response) => response == null
            ? null
            : P2pOrderInfoResponseExtended.fromJson(
                response.p2pOrderInfo,
                response.subscription,
              ),
      );

  /// Subscribes to order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Stream<P2pOrderInfoReceive?> subscribeOrderRaw(
    P2pOrderInfoRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<P2pOrderInfoReceive?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                BaseAPIException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderInfoReceive ? response : null;
        },
      );

  /// Unsubscribes from order subscription.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<ForgetResponse?> unsubscribeOrder() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes from order subscription.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  /// [subscriptionId] is the id of the subscription to unsubscribe from.
  static Future<ForgetResponse?> unsubscribeOrderRaw(
    String subscriptionId,
  ) async {
    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscriptionId);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all order subscriptions (Subscriptions to a single order or list).
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllOrder() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.p2pOrder);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Cancels this order.
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pOrderCancelResponse> cancel() async {
    final P2pOrderCancelReceive response = await cancelRaw();
    return P2pOrderCancelResponse.fromJson(response.p2pOrderCancel);
  }

  /// Cancels this order.
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pOrderCancelReceive> cancelRaw() async {
    final P2pOrderCancelReceive response =
        await _api.call(request: P2pOrderCancelRequest(id: p2pOrderInfo?.id));

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Confirms this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pOrderConfirmResponse> confirm() async {
    final P2pOrderConfirmReceive response = await confirmRaw();

    return P2pOrderConfirmResponse.fromJson(response.p2pOrderConfirm);
  }

  /// Confirms this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [BaseAPIException] if API response contains an error
  Future<P2pOrderConfirmReceive> confirmRaw() async {
    final P2pOrderConfirmReceive response =
        await _api.call(request: P2pOrderConfirmRequest(id: p2pOrderInfo?.id));

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }
}
