import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/p2p/exceptions/p2p_exception.dart';
import 'package:flutter_deriv_api/api/p2p/models/p2p_order_model.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advert/p2p_advert.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_advertiser/p2p_advertiser.dart';
import 'package:flutter_deriv_api/api/p2p/p2p_order/exceptions/p2p_order_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/basic_api/request.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/pending_request.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// P2P order class
class P2POrder extends P2POrderModel {
  /// Initializes
  P2POrder({
    String accountCurrency,
    P2PAdvert advertDetails,
    P2PAdvertiser advertiserDetails,
    double amount,
    String amountDisplay,
    String contactInfo,
    DateTime createdTime,
    DateTime expiryTime,
    String id,
    bool isIncoming,
    String localCurrency,
    String paymentInfo,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    OrderStatusType status,
    OrderType type,
  }) : super(
          accountCurrency: accountCurrency,
          advertDetails: advertDetails,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          contactInfo: contactInfo,
          createdTime: createdTime,
          expiryTime: expiryTime,
          id: id,
          isIncoming: isIncoming,
          localCurrency: localCurrency,
          paymentInfo: paymentInfo,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          status: status,
          type: type,
        );

  /// Creates an instance from JSON
  factory P2POrder.fromJson(Map<String, dynamic> json) => P2POrder(
        accountCurrency: json['account_currency'],
        advertDetails: P2PAdvert.fromJson(json['advert_details']),
        advertiserDetails: P2PAdvertiser.fromJson(json['advertiser_details']),
        amount: json['amount']?.toDouble(),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time']),
        expiryTime: getDateTime(json['expiry_time']),
        id: json['id'],
        isIncoming: getBool(json['is_incoming']),
        localCurrency: json['local_currency'],
        price: json['price']?.toDouble(),
        priceDisplay: json['price_display'],
        rate: json['rate']?.toDouble(),
        rateDisplay: json['rate_display'],
        status: getEnumFromString(
          values: OrderStatusType.values,
          name: json['status'],
        ),
        paymentInfo: json['payment_info'],
        type: getEnumFromString(
          values: OrderType.values,
          name: json['type'],
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Future<List<P2POrder>> fetchOrdersList(
    P2pOrderListRequest request,
  ) async {
    final P2pOrderListResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw P2PException(message: response.error['message']);
    }

    return getListFromMap(
      response.p2pOrderList['list'],
      itemToTypeCallback: (dynamic item) => P2POrder.fromJson(item),
    );
  }

  /// Subscribes to the list of [P2POrder] with parameters specified in [P2pOrderListRequest]
  static Stream<List<P2POrder>> getOrdersListUpdate(
    P2pOrderListRequest request,
    RequestCompareFunction comparePredicate,
  ) =>
      _api
          .subscribe(
        request: request,
        comparePredicate: comparePredicate,
      )
          .map<List<P2POrder>>(
        (Response response) {
          if (response.error != null) {
            throw P2POrderException(message: response.error['message']);
          }

          final P2pOrderListResponse listResponse = response;
          return getListFromMap(
            listResponse.p2pOrderList['list'],
            itemToTypeCallback: (dynamic item) => P2POrder.fromJson(item),
          );
        },
      );

  /// Creates order with parameters specified in [P2pOrderCreateRequest]
  static Future<P2POrder> create(P2pOrderCreateRequest request) async {
    final P2pOrderCreateResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw P2POrderException(message: response.error['message']);
    }

    return P2POrder.fromJson(response.p2pOrderCreate);
  }

  /// Creates order and subscribes to the result with parameters
  /// specified in [P2pOrderCreateRequest]
  static Stream<P2POrder> createAndSubscribe(P2pOrderCreateRequest request) =>
      _api.subscribe(request: request).map(
        (Response response) {
          if (response.error != null) {
            throw P2PException(message: response.error['message']);
          }

          final P2pOrderCreateResponse createResponse = response;
          return P2POrder.fromJson(createResponse.p2pOrderCreate);
        },
      );

  /// Gets order with parameters specified in [P2pOrderInfoRequest]
  static Future<P2POrder> getOrder(P2pOrderInfoRequest request) async {
    final P2pOrderInfoResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw P2POrderException(message: response.error['message']);
    }

    return P2POrder.fromJson(response.p2pOrderInfo);
  }

  /// Subscribes to order with parameters specified in [P2pOrderInfoRequest]
  static Stream<P2POrder> getOrderUpdate(P2pOrderInfoRequest request) => _api
          .subscribe(
        request: request,
        comparePredicate: ({
          Request request,
          PendingRequest<Response> pendingRequest,
          bool equatableResult,
        }) {
          final P2pOrderInfoRequest infoRequest = request;
          final P2pOrderInfoRequest pendingInfoRequest = pendingRequest.request;
          return infoRequest.id == pendingInfoRequest.id;
        },
      )
          .map<P2POrder>(
        (Response response) {
          if (response.error != null) {
            throw P2POrderException(message: response.error['message']);
          }

          return response is P2pOrderInfoResponse
              ? P2POrder.fromJson(response.p2pOrderInfo)
              : null;
        },
      );

  /// Cancel this order
  Future<P2POrder> cancel() async {
    final P2pOrderCancelResponse response =
        await _api.call(request: const P2pOrderCancelRequest());

    if (response.error != null) {
      throw P2POrderException(message: response.error['message']);
    }

    return copyWith(status: P2POrder.fromJson(response.p2pOrderCancel).status);
  }

  /// Confirm this order
  Future<P2POrder> confirm() async {
    final P2pOrderConfirmResponse response =
        await _api.call(request: const P2pOrderConfirmRequest());

    if (response.error != null) {
      throw P2POrderException(message: response.error['message']);
    }

    return copyWith(status: P2POrder.fromJson(response.p2pOrderConfirm).status);
  }

  /// Generate a copy of instance with given parameters
  P2POrder copyWith({
    String accountCurrency,
    P2PAdvert advertDetails,
    P2PAdvertiser advertiserDetails,
    double amount,
    String amountDisplay,
    String contactInfo,
    DateTime createdTime,
    DateTime expiryTime,
    String id,
    bool isIncoming,
    String localCurrency,
    String paymentInfo,
    double price,
    String priceDisplay,
    double rate,
    String rateDisplay,
    OrderStatusType status,
    OrderType type,
  }) =>
      P2POrder(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertDetails: advertDetails ?? this.advertDetails,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        expiryTime: expiryTime ?? this.expiryTime,
        id: id ?? this.id,
        isIncoming: isIncoming ?? this.isIncoming,
        localCurrency: localCurrency ?? this.localCurrency,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        status: status ?? this.status,
        type: type ?? this.type,
      );
}
