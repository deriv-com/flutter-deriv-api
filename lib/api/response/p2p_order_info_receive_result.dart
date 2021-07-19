// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/api/models/enums.dart';
import 'package:flutter_deriv_api/api/response/forget_all_receive_result.dart';
import 'package:flutter_deriv_api/api/response/forget_receive_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_cancel_receive_result.dart';
import 'package:flutter_deriv_api/api/response/p2p_order_confirm_receive_result.dart';
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
  P2pOrderInfoResponseModel({
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
  P2pOrderInfoResponse({
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
    final P2pOrderInfoReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2pOrderInfoResponse.fromJson(
        response.p2pOrderInfo, response.subscription);
  }

  /// Subscribes to this order
  Stream<P2pOrderInfoResponse?> subscribe({
    RequestCompareFunction? comparePredicate,
  }) =>
      subscribeOrder(
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
      _api
          .subscribe(request: request, comparePredicate: comparePredicate)!
          .map<P2pOrderInfoResponse?>(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                P2POrderException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderInfoReceive
              ? P2pOrderInfoResponse.fromJson(
                  response.p2pOrderInfo,
                  response.subscription,
                )
              : null;
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
    final P2pOrderCancelReceive response =
        await _api.call(request: P2pOrderCancelRequest(id: p2pOrderInfo?.id));

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2pOrderCancelResponse.fromJson(response.p2pOrderCancel);
  }

  /// Confirms this order
  ///
  /// Returns an order with updated status if successful.
  /// Throws a [P2POrderException] if API response contains an error
  Future<P2pOrderConfirmResponse> confirm() async {
    final P2pOrderConfirmReceive response =
        await _api.call(request: P2pOrderConfirmRequest(id: p2pOrderInfo?.id));

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return P2pOrderConfirmResponse.fromJson(response.p2pOrderConfirm);
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

/// TypeEnum2 mapper.
final Map<String, TypeEnum2> typeEnum2Mapper = <String, TypeEnum2>{
  "text": TypeEnum2.text,
  "memo": TypeEnum2.memo,
};

/// Type Enum.
enum TypeEnum2 {
  /// text.
  text,

  /// memo.
  memo,
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
  P2pOrderInfoModel({
    required this.type,
    required this.status,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.paymentInfo,
    required this.localCurrency,
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
    this.paymentMethod,
    this.paymentMethodDetails,
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

  /// Supported payment methods. Comma separated list.
  final String? paymentMethod;

  /// Details of available payment methods.
  final Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails;
}

/// P2p order info class.
class P2pOrderInfo extends P2pOrderInfoModel {
  /// Initializes P2p order info class.
  P2pOrderInfo({
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
    required String localCurrency,
    required String paymentInfo,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required StatusEnum status,
    required TypeEnum type,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
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
          localCurrency: localCurrency,
          paymentInfo: paymentInfo,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          status: status,
          type: type,
          paymentMethod: paymentMethod,
          paymentMethodDetails: paymentMethodDetails,
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
        localCurrency: json['local_currency'],
        paymentInfo: json['payment_info'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        status: statusEnumMapper[json['status']]!,
        type: typeEnumMapper[json['type']]!,
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
    resultMap['payment_method'] = paymentMethod;
    resultMap['payment_method_details'] = paymentMethodDetails;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderInfo copyWith({
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
    required String localCurrency,
    required String paymentInfo,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required StatusEnum status,
    required TypeEnum type,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
  }) =>
      P2pOrderInfo(
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
        localCurrency: localCurrency,
        paymentInfo: paymentInfo,
        price: price,
        priceDisplay: priceDisplay,
        rate: rate,
        rateDisplay: rateDisplay,
        status: status,
        type: type,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
      );
}
/// Advert details model class.
abstract class AdvertDetailsModel {
  /// Initializes Advert details model class .
  AdvertDetailsModel({
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
  AdvertDetails({
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
    required String description,
    required String id,
    required TypeEnum type,
    String? paymentMethod,
  }) =>
      AdvertDetails(
        description: description,
        id: id,
        type: type,
        paymentMethod: paymentMethod ?? this.paymentMethod,
      );
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel {
  /// Initializes Advertiser details model class .
  AdvertiserDetailsModel({
    required this.name,
    required this.loginid,
    required this.id,
    this.firstName,
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

  /// The advertiser's last name.
  final String? lastName;
}

/// Advertiser details class.
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes Advertiser details class.
  AdvertiserDetails({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    String? lastName,
  }) : super(
          id: id,
          loginid: loginid,
          name: name,
          firstName: firstName,
          lastName: lastName,
        );

  /// Creates an instance from JSON.
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        id: json['id'],
        loginid: json['loginid'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertiserDetails copyWith({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    String? lastName,
  }) =>
      AdvertiserDetails(
        id: id,
        loginid: loginid,
        name: name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
}
/// Client details model class.
abstract class ClientDetailsModel {
  /// Initializes Client details model class .
  ClientDetailsModel({
    required this.name,
    required this.loginid,
    required this.id,
    this.firstName,
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

  /// The client's last name.
  final String? lastName;
}

/// Client details class.
class ClientDetails extends ClientDetailsModel {
  /// Initializes Client details class.
  ClientDetails({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    String? lastName,
  }) : super(
          id: id,
          loginid: loginid,
          name: name,
          firstName: firstName,
          lastName: lastName,
        );

  /// Creates an instance from JSON.
  factory ClientDetails.fromJson(Map<String, dynamic> json) => ClientDetails(
        id: json['id'],
        loginid: json['loginid'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['loginid'] = loginid;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  ClientDetails copyWith({
    required String id,
    required String loginid,
    required String name,
    String? firstName,
    String? lastName,
  }) =>
      ClientDetails(
        id: id,
        loginid: loginid,
        name: name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );
}
/// Dispute details model class.
abstract class DisputeDetailsModel {
  /// Initializes Dispute details model class .
  DisputeDetailsModel({
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
  DisputeDetails({
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
  PaymentMethodDetailsPropertyModel({
    required this.method,
    required this.isEnabled,
    required this.fields,
    this.displayName,
  });

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
  PaymentMethodDetailsProperty({
    required Map<String, FieldsProperty> fields,
    required bool isEnabled,
    required String method,
    String? displayName,
  }) : super(
          fields: fields,
          isEnabled: isEnabled,
          method: method,
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
        displayName: json['display_name'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fields'] = fields;
    resultMap['is_enabled'] = isEnabled;
    resultMap['method'] = method;
    resultMap['display_name'] = displayName;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentMethodDetailsProperty copyWith({
    required Map<String, FieldsProperty> fields,
    required bool isEnabled,
    required String method,
    String? displayName,
  }) =>
      PaymentMethodDetailsProperty(
        fields: fields,
        isEnabled: isEnabled,
        method: method,
        displayName: displayName ?? this.displayName,
      );
}
/// Fields property model class.
abstract class FieldsPropertyModel {
  /// Initializes Fields property model class .
  FieldsPropertyModel({
    required this.value,
    required this.type,
    required this.required,
    required this.displayName,
  });

  /// Current value of payment method field.
  final String value;

  /// Field type.
  final TypeEnum2 type;

  /// Is field required or optional.
  final int required;

  /// Display name of payment method field.
  final String displayName;
}

/// Fields property class.
class FieldsProperty extends FieldsPropertyModel {
  /// Initializes Fields property class.
  FieldsProperty({
    required String displayName,
    required int required,
    required TypeEnum2 type,
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
        type: typeEnum2Mapper[json['type']]!,
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['required'] = required;
    resultMap['type'] = typeEnum2Mapper.entries
        .firstWhere((MapEntry<String, TypeEnum2> entry) => entry.value == type)
        .key;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FieldsProperty copyWith({
    required String displayName,
    required int required,
    required TypeEnum2 type,
    required String value,
  }) =>
      FieldsProperty(
        displayName: displayName,
        required: required,
        type: type,
        value: value,
      );
}
/// Subscription model class.
abstract class SubscriptionModel {
  /// Initializes Subscription model class .
  SubscriptionModel({
    required this.id,
  });

  /// A per-connection unique identifier. Can be passed to the `forget` API call to unsubscribe.
  final String id;
}

/// Subscription class.
class Subscription extends SubscriptionModel {
  /// Initializes Subscription class.
  Subscription({
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
    required String id,
  }) =>
      Subscription(
        id: id,
      );
}
