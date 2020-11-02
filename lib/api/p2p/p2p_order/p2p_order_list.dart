import 'package:flutter_deriv_api/api/common/forget/forget.dart';
import 'package:flutter_deriv_api/api/common/forget/forget_all.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/subscription_model.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_order/exceptions/p2p_order_exception.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_order/p2p_order.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Order list
class P2POrderList {
  /// Initializes
  P2POrderList({this.list, this.subscriptionInformation});

  /// Creates an instance from JSON
  factory P2POrderList.fromJson(
    List<dynamic> json, {
    Map<String, dynamic> subscriptionJson,
  }) =>
      P2POrderList(
        list: getListFromMap(
          json,
          itemToTypeCallback: (dynamic item) => P2POrder.fromJson(item),
        ),
        subscriptionInformation: SubscriptionModel.fromJson(subscriptionJson),
      );

  /// List of orders
  final List<P2POrder> list;

  /// Subscription information
  final SubscriptionModel subscriptionInformation;

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Future<P2POrderList> fetchOrderList([
    P2pOrderListRequest request,
  ]) async {
    final P2pOrderListResponse response = await _api.call(
      request: request ?? const P2pOrderListRequest(),
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2POrderList.fromJson(response.p2pOrderList['list']);
  }

  /// Subscribes to the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Stream<P2POrderList> subscribeOrderList({
    P2pOrderListRequest request,
    RequestCompareFunction comparePredicate,
  }) =>
      _api
          .subscribe(
        request: request ?? const P2pOrderListRequest(),
        comparePredicate: comparePredicate,
      )
          .map<P2POrderList>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
                P2POrderException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderListResponse
              ? P2POrderList.fromJson(
                  response.p2pOrderList['list'],
                  subscriptionJson: response.subscription,
                )
              : null;
        },
      );

  /// Unsubscribes from order list subscription.
  ///
  /// Throws a [P2POrderException] if API response contains an error
  Future<Forget> unsubscribeOrderList() async {
    if (subscriptionInformation?.id == null) {
      return null;
    }

    final ForgetResponse response =
        await _api.unsubscribe(subscriptionId: subscriptionInformation.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return Forget.fromResponse(response);
  }

  /// Unsubscribes from all order subscriptions (Subscriptions to a single order or list).
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Future<ForgetAll> unsubscribeAllOrder() =>
      P2POrder.unsubscribeAllOrder();
}
