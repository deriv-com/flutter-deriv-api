// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/p2p_advert_exception.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_create_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_create_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p advert create response model class.
abstract class P2pAdvertCreateResponseModel extends Equatable {
  /// Initializes P2p advert create response model class .
  const P2pAdvertCreateResponseModel({
    this.p2pAdvertCreate,
  });

  /// The information of the created P2P advert.
  final P2pAdvertCreate? p2pAdvertCreate;
}

/// P2p advert create response class.
class P2pAdvertCreateResponse extends P2pAdvertCreateResponseModel {
  /// Initializes P2p advert create response class.
  const P2pAdvertCreateResponse({
    P2pAdvertCreate? p2pAdvertCreate,
  }) : super(
          p2pAdvertCreate: p2pAdvertCreate,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertCreateResponse.fromJson(
    dynamic p2pAdvertCreateJson,
  ) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreateJson == null
            ? null
            : P2pAdvertCreate.fromJson(p2pAdvertCreateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertCreate != null) {
      resultMap['p2p_advert_create'] = p2pAdvertCreate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Creates a P2P (peer to peer) advert. Can only be used by an approved P2P advertiser.
  ///
  /// For parameters information refer to [P2pAdvertCreateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertCreateResponse> createAdvert(
    P2pAdvertCreateRequest request,
  ) async {
    final P2pAdvertCreateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertCreateResponse.fromJson(response.p2pAdvertCreate);
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertCreateResponse copyWith({
    P2pAdvertCreate? p2pAdvertCreate,
  }) =>
      P2pAdvertCreateResponse(
        p2pAdvertCreate: p2pAdvertCreate ?? this.p2pAdvertCreate,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}

/// CounterpartyTypeEnum mapper.
final Map<String, CounterpartyTypeEnum> counterpartyTypeEnumMapper =
    <String, CounterpartyTypeEnum>{
  "buy": CounterpartyTypeEnum.buy,
  "sell": CounterpartyTypeEnum.sell,
};

/// CounterpartyType Enum.
enum CounterpartyTypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}

/// TypeEnum mapper.
final Map<String, TypeEnum> typeEnumMapper = <String, TypeEnum>{
  "text": TypeEnum.text,
  "memo": TypeEnum.memo,
};

/// Type Enum.
enum TypeEnum {
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

/// P2pAdvertCreateTypeEnum mapper.
final Map<String, P2pAdvertCreateTypeEnum> p2pAdvertCreateTypeEnumMapper =
    <String, P2pAdvertCreateTypeEnum>{
  "buy": P2pAdvertCreateTypeEnum.buy,
  "sell": P2pAdvertCreateTypeEnum.sell,
};

/// Type Enum.
enum P2pAdvertCreateTypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}
/// P2p advert create model class.
abstract class P2pAdvertCreateModel extends Equatable {
  /// Initializes P2p advert create model class .
  const P2pAdvertCreateModel({
    required this.type,
    required this.remainingAmountDisplay,
    required this.remainingAmount,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.minOrderAmountLimitDisplay,
    required this.minOrderAmountLimit,
    required this.minOrderAmountDisplay,
    required this.minOrderAmount,
    required this.maxOrderAmountLimitDisplay,
    required this.maxOrderAmountLimit,
    required this.maxOrderAmountDisplay,
    required this.maxOrderAmount,
    required this.localCurrency,
    required this.isVisible,
    required this.isActive,
    required this.id,
    required this.description,
    required this.createdTime,
    required this.country,
    required this.counterpartyType,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.activeOrders,
    required this.accountCurrency,
    this.contactInfo,
    this.paymentInfo,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.paymentMethodNames,
  });

  /// The type of advertisement in relation to the advertiser's Deriv account.
  final P2pAdvertCreateTypeEnum type;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places.
  final String remainingAmountDisplay;

  /// Amount currently available for orders, in `account_currency`.
  final double remainingAmount;

  /// Conversion rate from account currency to local currency, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate from account currency to local currency.
  final double rate;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Cost of the advert in local currency.
  final double price;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountLimitDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double minOrderAmountLimit;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String minOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`.
  final double minOrderAmount;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountLimitDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double maxOrderAmountLimit;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String maxOrderAmountDisplay;

  /// Maximum order amount specified in advert, in `account_currency`.
  final double maxOrderAmount;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String localCurrency;

  /// Indicates that this advert will appear on the main advert list.
  final bool isVisible;

  /// The activation status of the advert.
  final bool isActive;

  /// The unique identifier for this advert.
  final String id;

  /// General information about the advert.
  final String description;

  /// The advert creation time in epoch.
  final DateTime createdTime;

  /// The target country code of the advert.
  final String country;

  /// Type of transaction from the opposite party's perspective.
  final CounterpartyTypeEnum counterpartyType;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String amountDisplay;

  /// The total amount specified in advert, in `account_currency`.
  final double amount;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// The number of active orders against this advert.
  final int activeOrders;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String? contactInfo;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String? paymentInfo;

  /// Payment method name (deprecated).
  final String? paymentMethod;

  /// Details of available payment methods (sell adverts only).
  final Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails;

  /// Names of supported payment methods.
  final List<String>? paymentMethodNames;
}

/// P2p advert create class.
class P2pAdvertCreate extends P2pAdvertCreateModel {
  /// Initializes P2p advert create class.
  const P2pAdvertCreate({
    required String accountCurrency,
    required int activeOrders,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required bool isVisible,
    required String localCurrency,
    required double maxOrderAmount,
    required String maxOrderAmountDisplay,
    required double maxOrderAmountLimit,
    required String maxOrderAmountLimitDisplay,
    required double minOrderAmount,
    required String minOrderAmountDisplay,
    required double minOrderAmountLimit,
    required String minOrderAmountLimitDisplay,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required P2pAdvertCreateTypeEnum type,
    String? contactInfo,
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
  }) : super(
          accountCurrency: accountCurrency,
          activeOrders: activeOrders,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          description: description,
          id: id,
          isActive: isActive,
          isVisible: isVisible,
          localCurrency: localCurrency,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          maxOrderAmountLimit: maxOrderAmountLimit,
          maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          minOrderAmountLimit: minOrderAmountLimit,
          minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
          contactInfo: contactInfo,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          paymentMethodDetails: paymentMethodDetails,
          paymentMethodNames: paymentMethodNames,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertCreate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertCreate(
        accountCurrency: json['account_currency'],
        activeOrders: json['active_orders'],
        advertiserDetails:
            AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount'])!,
        amountDisplay: json['amount_display'],
        counterpartyType:
            counterpartyTypeEnumMapper[json['counterparty_type']]!,
        country: json['country'],
        createdTime: getDateTime(json['created_time'])!,
        description: json['description'],
        id: json['id'],
        isActive: getBool(json['is_active'])!,
        isVisible: getBool(json['is_visible'])!,
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount'])!,
        maxOrderAmountDisplay: json['max_order_amount_display'],
        maxOrderAmountLimit: getDouble(json['max_order_amount_limit'])!,
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmount: getDouble(json['min_order_amount'])!,
        minOrderAmountDisplay: json['min_order_amount_display'],
        minOrderAmountLimit: getDouble(json['min_order_amount_limit'])!,
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        remainingAmount: getDouble(json['remaining_amount'])!,
        remainingAmountDisplay: json['remaining_amount_display'],
        type: p2pAdvertCreateTypeEnumMapper[json['type']]!,
        contactInfo: json['contact_info'],
        paymentInfo: json['payment_info'],
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
        paymentMethodNames: json['payment_method_names'] == null
            ? null
            : List<String>.from(
                json['payment_method_names']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['account_currency'] = accountCurrency;
    resultMap['active_orders'] = activeOrders;
    resultMap['advertiser_details'] = advertiserDetails.toJson();

    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['counterparty_type'] = counterpartyTypeEnumMapper.entries
        .firstWhere((MapEntry<String, CounterpartyTypeEnum> entry) =>
            entry.value == counterpartyType)
        .key;
    resultMap['country'] = country;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['description'] = description;
    resultMap['id'] = id;
    resultMap['is_active'] = isActive;
    resultMap['is_visible'] = isVisible;
    resultMap['local_currency'] = localCurrency;
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['max_order_amount_display'] = maxOrderAmountDisplay;
    resultMap['max_order_amount_limit'] = maxOrderAmountLimit;
    resultMap['max_order_amount_limit_display'] = maxOrderAmountLimitDisplay;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
    resultMap['min_order_amount_limit'] = minOrderAmountLimit;
    resultMap['min_order_amount_limit_display'] = minOrderAmountLimitDisplay;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = p2pAdvertCreateTypeEnumMapper.entries
        .firstWhere((MapEntry<String, P2pAdvertCreateTypeEnum> entry) =>
            entry.value == type)
        .key;
    resultMap['contact_info'] = contactInfo;
    resultMap['payment_info'] = paymentInfo;
    resultMap['payment_method'] = paymentMethod;
    resultMap['payment_method_details'] = paymentMethodDetails;
    if (paymentMethodNames != null) {
      resultMap['payment_method_names'] = paymentMethodNames!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertCreate copyWith({
    required String accountCurrency,
    required int activeOrders,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required bool isVisible,
    required String localCurrency,
    required double maxOrderAmount,
    required String maxOrderAmountDisplay,
    required double maxOrderAmountLimit,
    required String maxOrderAmountLimitDisplay,
    required double minOrderAmount,
    required String minOrderAmountDisplay,
    required double minOrderAmountLimit,
    required String minOrderAmountLimitDisplay,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required P2pAdvertCreateTypeEnum type,
    String? contactInfo,
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
  }) =>
      P2pAdvertCreate(
        accountCurrency: accountCurrency,
        activeOrders: activeOrders,
        advertiserDetails: advertiserDetails,
        amount: amount,
        amountDisplay: amountDisplay,
        counterpartyType: counterpartyType,
        country: country,
        createdTime: createdTime,
        description: description,
        id: id,
        isActive: isActive,
        isVisible: isVisible,
        localCurrency: localCurrency,
        maxOrderAmount: maxOrderAmount,
        maxOrderAmountDisplay: maxOrderAmountDisplay,
        maxOrderAmountLimit: maxOrderAmountLimit,
        maxOrderAmountLimitDisplay: maxOrderAmountLimitDisplay,
        minOrderAmount: minOrderAmount,
        minOrderAmountDisplay: minOrderAmountDisplay,
        minOrderAmountLimit: minOrderAmountLimit,
        minOrderAmountLimitDisplay: minOrderAmountLimitDisplay,
        price: price,
        priceDisplay: priceDisplay,
        rate: rate,
        rateDisplay: rateDisplay,
        remainingAmount: remainingAmount,
        remainingAmountDisplay: remainingAmountDisplay,
        type: type,
        contactInfo: contactInfo ?? this.contactInfo,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
        paymentMethodNames: paymentMethodNames ?? this.paymentMethodNames,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel extends Equatable {
  /// Initializes Advertiser details model class .
  const AdvertiserDetailsModel({
    required this.name,
    required this.id,
    this.firstName,
    this.lastName,
    this.totalCompletionRate,
  });

  /// The advertiser's displayed name.
  final String name;

  /// The advertiser's unique identifier.
  final String id;

  /// The advertiser's first name.
  final String? firstName;

  /// The advertiser's last name.
  final String? lastName;

  /// The percentage of successfully completed orders made by or placed against the advertiser within the past 30 days.
  final double? totalCompletionRate;
}

/// Advertiser details class.
class AdvertiserDetails extends AdvertiserDetailsModel {
  /// Initializes Advertiser details class.
  const AdvertiserDetails({
    required String id,
    required String name,
    String? firstName,
    String? lastName,
    double? totalCompletionRate,
  }) : super(
          id: id,
          name: name,
          firstName: firstName,
          lastName: lastName,
          totalCompletionRate: totalCompletionRate,
        );

  /// Creates an instance from JSON.
  factory AdvertiserDetails.fromJson(Map<String, dynamic> json) =>
      AdvertiserDetails(
        id: json['id'],
        name: json['name'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        totalCompletionRate: getDouble(json['total_completion_rate']),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['name'] = name;
    resultMap['first_name'] = firstName;
    resultMap['last_name'] = lastName;
    resultMap['total_completion_rate'] = totalCompletionRate;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  AdvertiserDetails copyWith({
    required String id,
    required String name,
    String? firstName,
    String? lastName,
    double? totalCompletionRate,
  }) =>
      AdvertiserDetails(
        id: id,
        name: name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        totalCompletionRate: totalCompletionRate ?? this.totalCompletionRate,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Payment method details property model class.
abstract class PaymentMethodDetailsPropertyModel extends Equatable {
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
    required Map<String, FieldsProperty> fields,
    required bool isEnabled,
    required String method,
    required PaymentMethodDetailsPropertyTypeEnum type,
    String? displayName,
  }) =>
      PaymentMethodDetailsProperty(
        fields: fields,
        isEnabled: isEnabled,
        method: method,
        type: type,
        displayName: displayName ?? this.displayName,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Fields property model class.
abstract class FieldsPropertyModel extends Equatable {
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
  final TypeEnum type;

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
    required TypeEnum type,
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
        type: typeEnumMapper[json['type']]!,
        value: json['value'],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['required'] = required;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;
    resultMap['value'] = value;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FieldsProperty copyWith({
    required String displayName,
    required int required,
    required TypeEnum type,
    required String value,
  }) =>
      FieldsProperty(
        displayName: displayName,
        required: required,
        type: type,
        value: value,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
