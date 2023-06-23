import 'package:deriv_dependency_injector/dependency_injector.dart';
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_info_response_extended.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_list_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';

/// Extends [P2pOrderListResponse] with additional methods.
class P2pOrderListResponseExtended extends P2pOrderListResponse {
  /// Initializes a new instance of [P2pOrderListResponseExtended].
  P2pOrderListResponseExtended({
    super.p2pOrderList,
    super.subscription,
  });

  /// Casts [P2pOrderListResponse] to [P2pOrderListResponseExtended].
  factory P2pOrderListResponseExtended.cast(P2pOrderListResponse response) =>
      P2pOrderListResponseExtended(
        p2pOrderList: response.p2pOrderList,
        subscription: response.subscription,
      );

  static final BaseAPI _api = Injector()<BaseAPI>();

  /// Gets the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Future<P2pOrderListResponse> fetchOrderList([
    P2pOrderListRequest? request,
  ]) async {
    final P2pOrderListReceive response =
        await fetchOrderListRaw(request ?? const P2pOrderListRequest());

    return P2pOrderListResponse.fromJson(
        response.p2pOrderList, response.subscription);
  }

  /// Gets the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Future<P2pOrderListReceive> fetchOrderListRaw([
    P2pOrderListRequest? request,
  ]) async {
    final P2pOrderListReceive response = await _api.call(
      request: request ?? const P2pOrderListRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          BaseAPIException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Subscribes to the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Stream<P2pOrderListResponse?> subscribeOrderList({
    P2pOrderListRequest? request,
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeOrderListRaw(
        request: request,
        comparePredicate: comparePredicate,
      ).map(
        (P2pOrderListReceive? response) => response == null
            ? null
            : P2pOrderListResponse.fromJson(
                response.p2pOrderList,
                response.subscription,
              ),
      );

  /// Subscribes to the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Stream<P2pOrderListReceive?> subscribeOrderListRaw({
    P2pOrderListRequest? request,
    RequestCompareFunction? comparePredicate,
  }) =>
      _api
          .subscribe(
        request: request ?? const P2pOrderListRequest(),
        comparePredicate: comparePredicate,
      )!
          .map<P2pOrderListReceive?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                BaseAPIException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderListReceive ? response : null;
        },
      );

  /// Unsubscribes from order list subscription.
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  Future<ForgetResponse?> unsubscribeOrderList() async {
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

  /// Unsubscribes from order list subscription.
  ///
  /// Throws a [BaseAPIException] if API response contains an error.
  static Future<ForgetResponse?> unsubscribeOrderListRaw(
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

  /// Unsubscribes from all order subscriptions (Subscriptions to a single order or list).
  ///
  /// Throws a [BaseAPIException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllOrder() =>
      P2pOrderInfoResponseExtended.unsubscribeAllOrder();
}
