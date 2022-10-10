// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';


import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_create_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_order_create_send.dart';
import 'package:flutter_deriv_api/basic_api/response.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/call_manager/base_call_manager.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p order create response model class.
abstract class P2pOrderCreateResponseModel {
  /// Initializes P2p order create response model class .
  const P2pOrderCreateResponseModel({
    this.p2pOrderCreate,
    this.subscription,
  });

  /// Information of the creates P2P order.
  final P2pOrderCreate? p2pOrderCreate;

  /// For subscription requests only.
  final Subscription? subscription;
}

/// P2p order create response class.
class P2pOrderCreateResponse extends P2pOrderCreateResponseModel {
  /// Initializes P2p order create response class.
  const P2pOrderCreateResponse({
    P2pOrderCreate? p2pOrderCreate,
    Subscription? subscription,
  }) : super(
          p2pOrderCreate: p2pOrderCreate,
          subscription: subscription,
        );

  /// Creates an instance from JSON.
  factory P2pOrderCreateResponse.fromJson(
    dynamic p2pOrderCreateJson,
    dynamic subscriptionJson,
  ) =>
      P2pOrderCreateResponse(
        p2pOrderCreate: p2pOrderCreateJson == null
            ? null
            : P2pOrderCreate.fromJson(p2pOrderCreateJson),
        subscription: subscriptionJson == null
            ? null
            : Subscription.fromJson(subscriptionJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pOrderCreate != null) {
      resultMap['p2p_order_create'] = p2pOrderCreate!.toJson();
    }
    if (subscription != null) {
      resultMap['subscription'] = subscription!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates order with parameters specified in [P2pOrderCreateRequest]
  static Future<P2pOrderCreateResponse> create(
      P2pOrderCreateRequest request) async {
    final P2pOrderCreateReceive response = await createRaw(request);

    return P2pOrderCreateResponse.fromJson(
        response.p2pOrderCreate, response.subscription);
  }

  /// Creates order with parameters specified in [P2pOrderCreateRequest]
  static Future<P2pOrderCreateReceive> createRaw(
      P2pOrderCreateRequest request) async {
    final P2pOrderCreateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates order and subscribes to the result with parameters specified in [P2pOrderCreateRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Stream<P2pOrderCreateResponse?> createAndSubscribe(
    P2pOrderCreateRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      createAndSubscribeRaw(
        request,
        comparePredicate: comparePredicate,
      ).map(
        (P2pOrderCreateReceive? response) => response != null
            ? P2pOrderCreateResponse.fromJson(
                response.p2pOrderCreate,
                response.subscription,
              )
            : null,
      );

  /// Creates order and subscribes to the result with parameters specified in [P2pOrderCreateRequest]
  ///
  /// Throws a [P2POrderException] if API response contains an error
  static Stream<P2pOrderCreateReceive?> createAndSubscribeRaw(
    P2pOrderCreateRequest request, {
    RequestCompareFunction? comparePredicate,
  }) =>
      _api.subscribe(request: request, comparePredicate: comparePredicate)!.map(
        (Response response) {
          checkException(
            response: response,
            exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
                P2POrderException(baseExceptionModel: baseExceptionModel),
          );

          return response is P2pOrderCreateReceive ? response : null;
        },
      );

  /// Creates a copy of instance with given parameters.
  P2pOrderCreateResponse copyWith({
    P2pOrderCreate? p2pOrderCreate,
    Subscription? subscription,
  }) =>
      P2pOrderCreateResponse(
        p2pOrderCreate: p2pOrderCreate ?? this.p2pOrderCreate,
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
};

/// Status Enum.
enum StatusEnum {
  /// pending.
  pending,
}
/// P2p order create model class.
abstract class P2pOrderCreateModel {
  /// Initializes P2p order create model class .
  const P2pOrderCreateModel({
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
    this.paymentMethod,
    this.paymentMethodDetails,
  });

  /// Type of the order.
  final TypeEnum type;

  /// The status of the created order.
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

  /// Supported payment methods. Comma separated list.
  final String? paymentMethod;

  /// Details of available payment methods.
  final Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails;
}

/// P2p order create class.
class P2pOrderCreate extends P2pOrderCreateModel {
  /// Initializes P2p order create class.
  const P2pOrderCreate({
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
          isReviewable: isReviewable,
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
  factory P2pOrderCreate.fromJson(Map<String, dynamic> json) => P2pOrderCreate(
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
    resultMap['payment_method'] = paymentMethod;
    resultMap['payment_method_details'] = paymentMethodDetails;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pOrderCreate copyWith({
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
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
  }) =>
      P2pOrderCreate(
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
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
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
  const AdvertiserDetails({
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
    String? id,
    String? loginid,
    String? name,
    String? firstName,
    String? lastName,
  }) =>
      AdvertiserDetails(
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
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
  const ClientDetails({
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
    String? id,
    String? loginid,
    String? name,
    String? firstName,
    String? lastName,
  }) =>
      ClientDetails(
        id: id ?? this.id,
        loginid: loginid ?? this.loginid,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
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
