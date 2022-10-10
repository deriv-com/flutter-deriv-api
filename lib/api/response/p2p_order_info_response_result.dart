// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_response_result.dart';
import 'package:flutter_deriv_api/api/response/forget_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_cancel_response_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_confirm_response_result.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_all_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/forget_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_cancel_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_cancel_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_confirm_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_confirm_send.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_info_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_info_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p order info response model class.
abstract class P2pOrderInfoResponseModel {
  /// Initializes P2p order info response model class .
  const P2pOrderInfoResponseModel({
    this.p2pOrderInfo,
    this.subscription,
  });

  /// The information of P2P order.
  final P2pOrderInfo? p2pOrderInfo;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// P2p order info response class.
class P2pOrderInfoResponse extends P2pOrderInfoResponseModel {
  /// Initializes P2p order info response class.
  const P2pOrderInfoResponse({
    P2pOrderInfo? p2pOrderInfo,
    Subscription? subscription,
  }) : super(
          p2pOrderInfo: p2pOrderInfo,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory P2pOrderInfoResponse.fromJson(
    dynamic p2pOrderInfoJson,
    dynamic subscriptionJson,
  ) =>
      P2pOrderInfoResponse(
        p2pOrderInfo: p2pOrderInfoJson == null
            ? null
            : P2pOrderInfo.fromJson(p2pOrderInfoJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderInfo != null) {
      resultMap['p2p_order_info'] = p2pOrderInfo!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Future<P2pOrderInfoResponse> fetchOrder(
      P2pOrderInfoRequest request) async {
    final P2pOrderInfoReceive response = await fetchOrderRaw(request);

    return P2pOrderInfoResponse.fromJson(
        response.p2pOrderInfo, response.subscription);
  }

  /// Gets order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Future<P2pOrderInfoReceive> fetchOrderRaw(
      P2pOrderInfoRequest request) async {
    final P2pOrderInfoReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Subscribes to this order
  Stream<P2pOrderInfoResponse?> subscribe({
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeOrder(
        P2pOrderInfoRequest(id: p2pOrderInfo?.id),
        comparePredicate: comparePredicate,
      );

  /// Subscribes to this order
  Stream<P2pOrderInfoReceive?> subscribeRaw({
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeOrderRaw(
        P2pOrderInfoRequest(id: p2pOrderInfo?.id),
        comparePredicate: comparePredicate,
      );

  /// Subscribes to order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Stream<P2pOrderInfoResponse?> subscribeOrder(
    P2pOrderInfoRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeOrderRaw(
        request,
        comparePredicate: comparePredicate,
      ).map(
        (P2pOrderInfoReceive? response) => response != null
            ? P2pOrderInfoResponse.fromJson(
                response.p2pOrderInfo,
                response.subscription,
              )
            : null,
      );

  /// Subscribes to order with parameters specified in [P2pOrderInfoRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
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
                P2POrderException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderInfoReceive ? response : null;
        },
      );

  /// Unsubscribes from order subscription.
  ///
  /// Throws a [P2POrderException] if API response contains an error
  Future<ForgetResponse?> unsubscribeOrder() async {
    if (subscription == null) {
      return null;
    }

    final ForgetReceive response =
        await _api.unsubscribe(subscriptionId: subscription!.id);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetResponse.fromJson(response.forget);
  }

  /// Unsubscribes all order subscriptions (Subscriptions to a single order or list).
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Future<ForgetAllResponse> unsubscribeAllOrder() async {
    final ForgetAllReceive response =
        await _api.unsubscribeAll(method: ForgetStreamType.p2pOrder);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return ForgetAllResponse.fromJson(response.forgetAll);
  }

  /// Cancels this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [P2POrderException] if API response contains an error
  Future<P2pOrderCancelResponse> cancel() async {
    final P2pOrderCancelReceive response = await cancelRaw();
    return P2pOrderCancelResponse.fromJson(response.p2pOrderCancel);
  }

  /// Cancels this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [P2POrderException] if API response contains an error
  Future<P2pOrderCancelReceive> cancelRaw() async {
    final P2pOrderCancelReceive response =
        await _api.call(request: P2pOrderCancelRequest(id: p2pOrderInfo?.id));

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Confirms this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [P2POrderException] if API response contains an error
  Future<P2pOrderConfirmResponse> confirm() async {
    final P2pOrderConfirmReceive response = await confirmRaw();

    return P2pOrderConfirmResponse.fromJson(response.p2pOrderConfirm);
  }

  /// Confirms this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [P2POrderException] if API response contains an error
  Future<P2pOrderConfirmReceive> confirmRaw() async {
    final P2pOrderConfirmReceive response =
        await _api.call(request: P2pOrderConfirmRequest(id: p2pOrderInfo?.id));

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderInfoResponse copyWith({
    P2pOrderInfo? p2pOrderInfo,
    Subscription? subscription,
  }) =>
      P2pOrderInfoResponse(
        p2pOrderInfo: p2pOrderInfo ?? this.p2pOrderInfo,
        subscription: subscription ?? this.subscription,
      );
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "buy": TypeEnum.buy,
  "sell": TypeEnum.sell,
};

/// Type Enum.
enum TypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}

/// FieldsPropertyTypeEnum mapper.
final Map<String, FieldsPropertyTypeEnum> fieldsPropertyTypeEnumMapper =
    <String, FieldsPropertyTypeEnum>{
  "text": FieldsPropertyTypeEnum.text,
  "memo": FieldsPropertyTypeEnum.memo,
};

/// Type Enum.
enum FieldsPropertyTypeEnum {
  /// text.
  text,

  /// memo.
  memo,
}

/// PaymentMethodDetailsPropertyTypeEnum mapper.
final Map<String, PaymentMethodDetailsPropertyTypeEnum>
    paymentMethodDetailsPropertyTypeEnumMapper =
    <String, PaymentMethodDetailsPropertyTypeEnum>{
  "bank": PaymentMethodDetailsPropertyTypeEnum.bank,
  "ewallet": PaymentMethodDetailsPropertyTypeEnum.ewallet,
  "other": PaymentMethodDetailsPropertyTypeEnum.other,
};

/// Type Enum.
enum PaymentMethodDetailsPropertyTypeEnum {
  /// bank.
  bank,

  /// ewallet.
  ewallet,

  /// other.
  other,
}

/// StatusEnum mapper.
final Map<String, StatusEnum> statusEnumMapper = <String, StatusEnum>{
  "pending": StatusEnum.pending,
  "buyer-confirmed": StatusEnum.buyerConfirmed,
  "cancelled": StatusEnum.cancelled,
  "timed-out": StatusEnum.timedOut,
  "blocked": StatusEnum.blocked,
  "refunded": StatusEnum.refunded,
  "completed": StatusEnum.completed,
  "disputed": StatusEnum.disputed,
  "dispute-refunded": StatusEnum.disputeRefunded,
  "dispute-completed": StatusEnum.disputeCompleted,
};

/// Status Enum.
enum StatusEnum {
  /// pending.
  pending,

  /// buyer-confirmed.
  buyerConfirmed,

  /// cancelled.
  cancelled,

  /// timed-out.
  timedOut,

  /// blocked.
  blocked,

  /// refunded.
  refunded,

  /// completed.
  completed,

  /// disputed.
  disputed,

  /// dispute-refunded.
  disputeRefunded,

  /// dispute-completed.
  disputeCompleted,
}
/// P2p order info model class.
abstract class P2pOrderInfoModel {
  /// Initializes P2p order info model class .
  const P2pOrderInfoModel({
    required this.type,
    required this.status,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.paymentInfo,
    required this.localCurrency,
    required this.isReviewable,
    required this.isIncoming,
    required this.id,
    required this.expiryTime,
    required this.disputeDetails,
    required this.createdTime,
    required this.contactInfo,
    required this.clientDetails,
    required this.chatChannelUrl,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.advertDetails,
    required this.accountCurrency,
    this.completionTime,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.reviewDetails,
  });

  /// Whether this is a buy or a sell.
  final TypeEnum type;

  /// Current order status.
  final StatusEnum status;

  /// Conversion rate of the order, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate of the order.
  final double rate;

  /// Cost in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Cost in local currency.
  final double price;

  /// Payment instructions.
  final String paymentInfo;

  /// Local currency for this order.
  final String localCurrency;

  /// `true` if a review can be given, otherwise `false`.
  final bool isReviewable;

  /// `true` if the order is created for the advert of the current client, otherwise `false`.
  final bool isIncoming;

  /// The unique identifier for this order.
  final String id;

  /// The epoch time in which the order will be expired.
  final DateTime expiryTime;

  /// Details of the order dispute.
  final DisputeDetails disputeDetails;

  /// The epoch time of the order creation.
  final DateTime createdTime;

  /// Seller contact information.
  final String contactInfo;

  /// Details of the client who created the order.
  final ClientDetails clientDetails;

  /// The URL to be used to initialise the chat for this order.
  final String chatChannelUrl;

  /// The amount of the order, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The amount of the order.
  final double amount;

  /// Details of the advertiser for this order.
  final AdvertiserDetails advertiserDetails;

  /// Details of the advert for this order.
  final AdvertDetails advertDetails;

  /// The currency of order.
  final String accountCurrency;

  /// The epoch time of the order completion.
  final DateTime? completionTime;

  /// Supported payment methods. Comma separated list.
  final String? paymentMethod;

  /// Details of available payment methods.
  final Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails;

  /// Details of the review you gave for this order, if any.
  final ReviewDetails? reviewDetails;
}

/// P2p order info class.
class P2pOrderInfo extends P2pOrderInfoModel {
  /// Initializes P2p order info class.
  const P2pOrderInfo({
    required String accountCurrency,
    required AdvertDetails advertDetails,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required String chatChannelUrl,
    required ClientDetails clientDetails,
    required String contactInfo,
    required DateTime createdTime,
    required DisputeDetails disputeDetails,
    required DateTime expiryTime,
    required String id,
    required bool isIncoming,
    required bool isReviewable,
    required String localCurrency,
    required String paymentInfo,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required StatusEnum status,
    required TypeEnum type,
    DateTime? completionTime,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    ReviewDetails? reviewDetails,
  }) : super(
          accountCurrency: accountCurrency,
          advertDetails: advertDetails,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          chatChannelUrl: chatChannelUrl,
          clientDetails: clientDetails,
          contactInfo: contactInfo,
          createdTime: createdTime,
          disputeDetails: disputeDetails,
          expiryTime: expiryTime,
          id: id,
          isIncoming: isIncoming,
          isReviewable: isReviewable,
          localCurrency: localCurrency,
          paymentInfo: paymentInfo,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          status: status,
          type: type,
          completionTime: completionTime,
          paymentMethod: paymentMethod,
          paymentMethodDetails: paymentMethodDetails,
          reviewDetails: reviewDetails,
        );

  /// Creates an instance from JSON.
  factory P2pOrderInfo.fromJson(Map<String, dynamic> json) => P2pOrderInfo(
        accountCurrency: json['account_currency'],
        advertDetails: AdvertDetails.fromJson(json['advert_details']),
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount'])!,
        amountDisplay: json['amount_display'],
        chatChannelUrl: json['chat_channel_url'],
        clientDetails: ClientDetails.fromJson(json['client_details']),
        contactInfo: json['contact_info'],
        createdTime: getDateTime(json['created_time'])!,
        disputeDetails: DisputeDetails.fromJson(json['dispute_details']),
        expiryTime: getDateTime(json['expiry_time'])!,
        id: json['id'],
        isIncoming: getBool(json['is_incoming'])!,
        isReviewable: getBool(json['is_reviewable'])!,
        localCurrency: json['local_currency'],
        paymentInfo: json['payment_info'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        status: statusEnumMapper[json['status']]!,
        type: typeEnumMapper[json['type']]!,
        completionTime: getDateTime(json['completion_time']),
        paymentMethod: json['payment_method'],
        paymentMethodDetails: json['payment_method_details'] == null
            ? null
            : Map<String, PaymentMethodDetailsProperty>.fromEntries(
                json['payment_method_details']
                    .entries
                    .map<MapEntry<String, PaymentMethodDetailsProperty>>(
                        (MapEntry<String, dynamic> entry) =>
                            MapEntry<String, PaymentMethodDetailsProperty>(
                                entry.key,
                                PaymentMethodDetailsProperty.fromJson(
                                    entry.value)))),
        reviewDetails: json['review_details'] == null
            ? null
            : ReviewDetails.fromJson(json['review_details']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    resultMap['advert_details'] = advertDetails.toJson();

    resultMap['advertiser_details'] = advertiserDetails.toJson();

    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['chat_channel_url'] = chatChannelUrl;
    resultMap['client_details'] = clientDetails.toJson();

    resultMap['contact_info'] = contactInfo;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['dispute_details'] = disputeDetails.toJson();

    resultMap['expiry_time'] = getSecondsSinceEpochDateTime(expiryTime);
    resultMap['id'] = id;
    resultMap['is_incoming'] = isIncoming;
    resultMap['is_reviewable'] = isReviewable;
    resultMap['local_currency'] = localCurrency;
    resultMap['payment_info'] = paymentInfo;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['status'] = statusEnumMapper.entries
        .firstWhere(
            (MapEntry<String, StatusEnum> entry) => entry.value == status)
        .key;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['completion_time'] = getSecondsSinceEpochDateTime(completionTime);
    resultMap['payment_method'] = paymentMethod;
    resultMap['payment_method_details'] = paymentMethodDetails;
    if (reviewDetails != null) {
      resultMap['review_details'] = reviewDetails!.toJson();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderInfo copyWith({
    String? accountCurrency,
    AdvertDetails? advertDetails,
    AdvertiserDetails? advertiserDetails,
    double? amount,
    String? amountDisplay,
    String? chatChannelUrl,
    ClientDetails? clientDetails,
    String? contactInfo,
    DateTime? createdTime,
    DisputeDetails? disputeDetails,
    DateTime? expiryTime,
    String? id,
    bool? isIncoming,
    bool? isReviewable,
    String? localCurrency,
    String? paymentInfo,
    double? price,
    String? priceDisplay,
    double? rate,
    String? rateDisplay,
    StatusEnum? status,
    TypeEnum? type,
    DateTime? completionTime,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    ReviewDetails? reviewDetails,
  }) =>
      P2pOrderInfo(
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertDetails: advertDetails ?? this.advertDetails,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        chatChannelUrl: chatChannelUrl ?? this.chatChannelUrl,
        clientDetails: clientDetails ?? this.clientDetails,
        contactInfo: contactInfo ?? this.contactInfo,
        createdTime: createdTime ?? this.createdTime,
        disputeDetails: disputeDetails ?? this.disputeDetails,
        expiryTime: expiryTime ?? this.expiryTime,
        id: id ?? this.id,
        isIncoming: isIncoming ?? this.isIncoming,
        isReviewable: isReviewable ?? this.isReviewable,
        localCurrency: localCurrency ?? this.localCurrency,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        status: status ?? this.status,
        type: type ?? this.type,
        completionTime: completionTime ?? this.completionTime,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
        reviewDetails: reviewDetails ?? this.reviewDetails,
      );
}
/// Advert details model class.
abstract class AdvertDetailsModel {
  /// Initializes Advert details model class .
  const AdvertDetailsModel({
    required this.type,
    required this.id,
    required this.description,
    this.paymentMethod,
  });

  /// Type of the advert.
  final TypeEnum type;

  /// The unique identifier for the advert.
  final String id;

  /// General information about the advert.
  final String description;

  /// The payment method.
  final String? paymentMethod;
}

/// Advert details class.
class AdvertDetails extends AdvertDetailsModel {
  /// Initializes Advert details class.
  const AdvertDetails({
    required String description,
    required String id,
    required TypeEnum type,
    String? paymentMethod,
  }) : super(
          description: description,
          id: id,
          type: type,
          paymentMethod: paymentMethod,
        );

  /// Creates an instance from JSON.
  factory AdvertDetails.fromJson(Map<String, dynamic> json) => AdvertDetails(
        description: json['description'],
        id: json['id'],
        type: typeEnumMapper[json['type']]!,
        paymentMethod: json['payment_method'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['description'] = description;
    resultMap['id'] = id;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['payment_method'] = paymentMethod;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertDetails copyWith({
    String? description,
    String? id,
    TypeEnum? type,
    String? paymentMethod,
  }) =>
      AdvertDetails(
        description: description ?? this.description,
        id: id ?? this.id,
        type: type ?? this.type,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel {
  /// Initializes Advertiser details model class .
  const AdvertiserDetailsModel({
    required this.name,
    required this.loginid,
    required this.id,
    this.firstName,
    this.isRecommended,
    this.lastName,
  });

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's account identifier.
  final String loginid;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's first name.
  final String? firstName;

  /// Indicates that the advertiser was recommended in the most recent review by the current user.
  final int? isRecommended;

  /// The advertiser's last name.
  final String? lastName;
}

/// Advertiser details class.
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes Advertiser details class.
  const AdvertiserDetails({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    int? isRecommended,
    String? lastName,
  }) : super(
          id: id,
          loginid: loginid,
          name: name,
          firstName: firstName,
          isRecommended: isRecommended,
          lastName: lastName,
        );

  /// Creates an instance from JSON.
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        id: json['id'],
        loginid: json['loginid'],
        name: json['name'],
        firstName: json['first_name'],
        isRecommended: json['is_recommended'],
        lastName: json['last_name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['is_recommended'] = isRecommended;
    resultMap['last_name'] = lastName;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertiserDetails copyWith({
    String? id,
    String? loginid,
    String? name,
    String? firstName,
    int? isRecommended,
    String? lastName,
  }) =>
      AdvertiserDetails(
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        isRecommended: isRecommended ?? this.isRecommended,
        lastName: lastName ?? this.lastName,
      );
}
/// Client details model class.
abstract class ClientDetailsModel {
  /// Initializes Client details model class .
  const ClientDetailsModel({
    required this.name,
    required this.loginid,
    required this.id,
    this.firstName,
    this.isRecommended,
    this.lastName,
  });

  /// The client's displayed name.
  final String name;

  /// The client's account identifier.
  final String loginid;

  /// The client's unique P2P identifier.
  final String id;

  /// The client's first name.
  final String? firstName;

  /// Indicates that the client was recommended in the most recent review by the current user.
  final int? isRecommended;

  /// The client's last name.
  final String? lastName;
}

/// Client details class.
class ClientDetails extends ClientDetailsModel {
  /// Initializes Client details class.
  const ClientDetails({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    int? isRecommended,
    String? lastName,
  }) : super(
          id: id,
          loginid: loginid,
          name: name,
          firstName: firstName,
          isRecommended: isRecommended,
          lastName: lastName,
        );

  /// Creates an instance from JSON.
  factory ClientDetails.fromJson(Map<String, dynamic> json) => ClientDetails(
        id: json['id'],
        loginid: json['loginid'],
        name: json['name'],
        firstName: json['first_name'],
        isRecommended: json['is_recommended'],
        lastName: json['last_name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['is_recommended'] = isRecommended;
    resultMap['last_name'] = lastName;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ClientDetails copyWith({
    String? id,
    String? loginid,
    String? name,
    String? firstName,
    int? isRecommended,
    String? lastName,
  }) =>
      ClientDetails(
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        isRecommended: isRecommended ?? this.isRecommended,
        lastName: lastName ?? this.lastName,
      );
}
/// Dispute details model class.
abstract class DisputeDetailsModel {
  /// Initializes Dispute details model class .
  const DisputeDetailsModel({
    this.disputeReason,
    this.disputerLoginid,
  });

  /// The dispute reason
  final String? disputeReason;

  /// The loginid of the client who's raising the dispute
  final String? disputerLoginid;
}

/// Dispute details class.
class DisputeDetails extends DisputeDetailsModel {
  /// Initializes Dispute details class.
  const DisputeDetails({
    String? disputeReason,
    String? disputerLoginid,
  }) : super(
          disputeReason: disputeReason,
          disputerLoginid: disputerLoginid,
        );

  /// Creates an instance from JSON.
  factory DisputeDetails.fromJson(Map<String, dynamic> json) => DisputeDetails(
        disputeReason: json['dispute_reason'],
        disputerLoginid: json['disputer_loginid'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['dispute_reason'] = disputeReason;
    resultMap['disputer_loginid'] = disputerLoginid;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  DisputeDetails copyWith({
    String? disputeReason,
    String? disputerLoginid,
  }) =>
      DisputeDetails(
        disputeReason: disputeReason ?? this.disputeReason,
        disputerLoginid: disputerLoginid ?? this.disputerLoginid,
      );
}
/// Payment method details property model class.
abstract class PaymentMethodDetailsPropertyModel {
  /// Initializes Payment method details property model class .
  const PaymentMethodDetailsPropertyModel({
    required this.type,
    required this.method,
    required this.isEnabled,
    required this.fields,
    this.displayName,
  });

  /// Payment method type.
  final PaymentMethodDetailsPropertyTypeEnum type;

  /// Payment method identifier.
  final String method;

  /// Indicates whether method is enabled.
  final bool isEnabled;

  /// Payment method fields.
  final Map<String, FieldsProperty> fields;

  /// Display name of payment method.
  final String? displayName;
}

/// Payment method details property class.
class PaymentMethodDetailsProperty extends PaymentMethodDetailsPropertyModel {
  /// Initializes Payment method details property class.
  const PaymentMethodDetailsProperty({
    required Map<String, FieldsProperty> fields,
    required bool isEnabled,
    required String method,
    required PaymentMethodDetailsPropertyTypeEnum type,
    String? displayName,
  }) : super(
          fields: fields,
          isEnabled: isEnabled,
          method: method,
          type: type,
          displayName: displayName,
        );

  /// Creates an instance from JSON.
  factory PaymentMethodDetailsProperty.fromJson(Map<String, dynamic> json) =>
      PaymentMethodDetailsProperty(
        fields: Map<String, FieldsProperty>.fromEntries(json['fields']
            .entries
            .map<MapEntry<String, FieldsProperty>>(
                (MapEntry<String, dynamic> entry) =>
                    MapEntry<String, FieldsProperty>(
                        entry.key, FieldsProperty.fromJson(entry.value)))),
        isEnabled: getBool(json['is_enabled'])!,
        method: json['method'],
        type: paymentMethodDetailsPropertyTypeEnumMapper[json['type']]!,
        displayName: json['display_name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fields'] = fields;
    resultMap['is_enabled'] = isEnabled;
    resultMap['method'] = method;
    resultMap['type'] = paymentMethodDetailsPropertyTypeEnumMapper.entries
        .firstWhere(
            (MapEntry<String, PaymentMethodDetailsPropertyTypeEnum> entry) =>
                entry.value == type)
        .key;
    resultMap['display_name'] = displayName;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentMethodDetailsProperty copyWith({
    Map<String, FieldsProperty>? fields,
    bool? isEnabled,
    String? method,
    PaymentMethodDetailsPropertyTypeEnum? type,
    String? displayName,
  }) =>
      PaymentMethodDetailsProperty(
        fields: fields ?? this.fields,
        isEnabled: isEnabled ?? this.isEnabled,
        method: method ?? this.method,
        type: type ?? this.type,
        displayName: displayName ?? this.displayName,
      );
}
/// Fields property model class.
abstract class FieldsPropertyModel {
  /// Initializes Fields property model class .
  const FieldsPropertyModel({
    required this.value,
    required this.type,
    required this.required,
    required this.displayName,
  });

  /// Current value of payment method field.
  final String value;

  /// Field type.
  final FieldsPropertyTypeEnum type;

  /// Is field required or optional.
  final int required;

  /// Display name of payment method field.
  final String displayName;
}

/// Fields property class.
class FieldsProperty extends FieldsPropertyModel {
  /// Initializes Fields property class.
  const FieldsProperty({
    required String displayName,
    required int required,
    required FieldsPropertyTypeEnum type,
    required String value,
  }) : super(
          displayName: displayName,
          required: required,
          type: type,
          value: value,
        );

  /// Creates an instance from JSON.
  factory FieldsProperty.fromJson(Map<String, dynamic> json) => FieldsProperty(
        displayName: json['display_name'],
        required: json['required'],
        type: fieldsPropertyTypeEnumMapper[json['type']]!,
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['required'] = required;
    resultMap['type'] = fieldsPropertyTypeEnumMapper.entries
        .firstWhere((MapEntry<String, FieldsPropertyTypeEnum> entry) =>
            entry.value == type)
        .key;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FieldsProperty copyWith({
    String? displayName,
    int? required,
    FieldsPropertyTypeEnum? type,
    String? value,
  }) =>
      FieldsProperty(
        displayName: displayName ?? this.displayName,
        required: required ?? this.required,
        type: type ?? this.type,
        value: value ?? this.value,
      );
}
/// Review details model class.
abstract class ReviewDetailsModel {
  /// Initializes Review details model class .
  const ReviewDetailsModel({
    required this.rating,
    required this.createdTime,
    this.recommended,
  });

  /// Rating for the transaction, 1 to 5.
  final int rating;

  /// The epoch time of the review.
  final DateTime createdTime;

  /// `1` if the advertiser is recommended, `0` if not recommended.
  final int? recommended;
}

/// Review details class.
class ReviewDetails extends ReviewDetailsModel {
  /// Initializes Review details class.
  const ReviewDetails({
    required DateTime createdTime,
    required int rating,
    int? recommended,
  }) : super(
          createdTime: createdTime,
          rating: rating,
          recommended: recommended,
        );

  /// Creates an instance from JSON.
  factory ReviewDetails.fromJson(Map<String, dynamic> json) => ReviewDetails(
        createdTime: getDateTime(json['created_time'])!,
        rating: json['rating'],
        recommended: json['recommended'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['rating'] = rating;
    resultMap['recommended'] = recommended;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ReviewDetails copyWith({
    DateTime? createdTime,
    int? rating,
    int? recommended,
  }) =>
      ReviewDetails(
        createdTime: createdTime ?? this.createdTime,
        rating: rating ?? this.rating,
        recommended: recommended ?? this.recommended,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  const SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  const Subscription({
    required String id,
  }) : super(
          id: id,
        );

  /// Creates an instance from JSON.
  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        id: json['id'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  Subscription copyWith({
    String? id,
  }) =>
      Subscription(
        id: id ?? this.id,
      );
}
