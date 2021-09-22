// ignore_for_file: prefer_single_quotes
import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_update_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advert_update_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';


/// P2p advert update response model class.
abstract class P2pAdvertUpdateResponseModel {
  /// Initializes P2p advert update response model class .
  P2pAdvertUpdateResponseModel({
    this.p2pAdvertUpdate,
  });

  /// P2P updated advert information.
  final P2pAdvertUpdate? p2pAdvertUpdate;
}

/// P2p advert update response class.
class P2pAdvertUpdateResponse extends P2pAdvertUpdateResponseModel {
  /// Initializes P2p advert update response class.
  P2pAdvertUpdateResponse({
    P2pAdvertUpdate? p2pAdvertUpdate,
  }) : super(
          p2pAdvertUpdate: p2pAdvertUpdate,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertUpdateResponse.fromJson(
    dynamic p2pAdvertUpdateJson,
  ) =>
      P2pAdvertUpdateResponse(
        p2pAdvertUpdate: p2pAdvertUpdateJson == null
            ? null
            : P2pAdvertUpdate.fromJson(p2pAdvertUpdateJson),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (p2pAdvertUpdate != null) {
      resultMap['p2p_advert_update'] = p2pAdvertUpdate!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Updates a P2P (peer to peer) advert. Can only be used by the advertiser.
  ///
  /// For parameters information refer to [P2pAdvertUpdateRequest].
  /// Throws a [P2PAdvertException] if API response contains an error
  static Future<P2pAdvertUpdateResponse> updateAdvert(
    P2pAdvertUpdateRequest request,
  ) async {
    final P2pAdvertUpdateReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertException(baseExceptionModel: baseExceptionModel),
    );

    return P2pAdvertUpdateResponse.fromJson(response.p2pAdvertUpdate);
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertUpdateResponse copyWith({
    P2pAdvertUpdate? p2pAdvertUpdate,
  }) =>
      P2pAdvertUpdateResponse(
        p2pAdvertUpdate: p2pAdvertUpdate ?? this.p2pAdvertUpdate,
      );
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

/// P2pAdvertUpdateTypeEnum mapper.
final Map<String, P2pAdvertUpdateTypeEnum> p2pAdvertUpdateTypeEnumMapper =
    <String, P2pAdvertUpdateTypeEnum>{
  "buy": P2pAdvertUpdateTypeEnum.buy,
  "sell": P2pAdvertUpdateTypeEnum.sell,
};

/// Type Enum.
enum P2pAdvertUpdateTypeEnum {
  /// buy.
  buy,

  /// sell.
  sell,
}
/// P2p advert update model class.
abstract class P2pAdvertUpdateModel {
  /// Initializes P2p advert update model class .
  P2pAdvertUpdateModel({
    required this.id,
    this.accountCurrency,
    this.advertiserDetails,
    this.amount,
    this.amountDisplay,
    this.contactInfo,
    this.counterpartyType,
    this.country,
    this.createdTime,
    this.daysUntilArchive,
    this.deleted,
    this.description,
    this.isActive,
    this.isVisible,
    this.localCurrency,
    this.maxOrderAmount,
    this.maxOrderAmountDisplay,
    this.maxOrderAmountLimit,
    this.maxOrderAmountLimitDisplay,
    this.minOrderAmount,
    this.minOrderAmountDisplay,
    this.minOrderAmountLimit,
    this.minOrderAmountLimitDisplay,
    this.paymentInfo,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.paymentMethodNames,
    this.price,
    this.priceDisplay,
    this.rate,
    this.rateDisplay,
    this.remainingAmount,
    this.remainingAmountDisplay,
    this.type,
  });

  /// The unique identifier for this advert.
  final String id;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String? accountCurrency;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails? advertiserDetails;

  /// The total amount specified in advert, in `account_currency`.
  final double? amount;

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String? amountDisplay;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String? contactInfo;

  /// Type of transaction from the opposite party's perspective.
  final CounterpartyTypeEnum? counterpartyType;

  /// The target country code of the advert.
  final String? country;

  /// The advert creation time in epoch.
  final DateTime? createdTime;

  /// Days until automatic inactivation of this ad, if no activity occurs.
  final int? daysUntilArchive;

  /// Indicates that the advert has been deleted.
  final int? deleted;

  /// General information about the advert.
  final String? description;

  /// The activation status of the advert.
  final bool? isActive;

  /// Indicates that this advert will appear on the main advert list.
  final bool? isVisible;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String? localCurrency;

  /// Maximum order amount specified in advert, in `account_currency`.
  final double? maxOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String? maxOrderAmountDisplay;

  /// Maximum order amount at this time, in `account_currency`.
  final double? maxOrderAmountLimit;

  /// Maximum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String? maxOrderAmountLimitDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible to the advert owner.
  final double? minOrderAmount;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places.
  final String? minOrderAmountDisplay;

  /// Minimum order amount at this time, in `account_currency`.
  final double? minOrderAmountLimit;

  /// Minimum order amount at this time, in `account_currency`, formatted to appropriate decimal places.
  final String? minOrderAmountLimitDisplay;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String? paymentInfo;

  /// Supported payment methods. Comma separated list of identifiers
  final String? paymentMethod;

  /// Details of available payment methods.
  final Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails;

  /// Names of supported payment methods.
  final List<String>? paymentMethodNames;

  /// Cost of the advert in local currency.
  final double? price;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String? priceDisplay;

  /// Conversion rate from account currency to local currency.
  final double? rate;

  /// Conversion rate from account currency to local currency, formatted to appropriate decimal places.
  final String? rateDisplay;

  /// Amount currently available for orders, in `account_currency`.
  final double? remainingAmount;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places.
  final String? remainingAmountDisplay;

  /// Whether this is a buy or a sell.
  final P2pAdvertUpdateTypeEnum? type;
}

/// P2p advert update class.
class P2pAdvertUpdate extends P2pAdvertUpdateModel {
  /// Initializes P2p advert update class.
  P2pAdvertUpdate({
    required String id,
    String? accountCurrency,
    AdvertiserDetails? advertiserDetails,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    CounterpartyTypeEnum? counterpartyType,
    String? country,
    DateTime? createdTime,
    int? daysUntilArchive,
    int? deleted,
    String? description,
    bool? isActive,
    bool? isVisible,
    String? localCurrency,
    double? maxOrderAmount,
    String? maxOrderAmountDisplay,
    double? maxOrderAmountLimit,
    String? maxOrderAmountLimitDisplay,
    double? minOrderAmount,
    String? minOrderAmountDisplay,
    double? minOrderAmountLimit,
    String? minOrderAmountLimitDisplay,
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    double? rate,
    String? rateDisplay,
    double? remainingAmount,
    String? remainingAmountDisplay,
    P2pAdvertUpdateTypeEnum? type,
  }) : super(
          id: id,
          accountCurrency: accountCurrency,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          contactInfo: contactInfo,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          daysUntilArchive: daysUntilArchive,
          deleted: deleted,
          description: description,
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
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          paymentMethodDetails: paymentMethodDetails,
          paymentMethodNames: paymentMethodNames,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertUpdate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdate(
        id: json['id'],
        accountCurrency: json['account_currency'],
        advertiserDetails: json['advertiser_details'] == null
            ? null
            : AdvertiserDetails.fromJson(json['advertiser_details']),
        amount: getDouble(json['amount']),
        amountDisplay: json['amount_display'],
        contactInfo: json['contact_info'],
        counterpartyType: json['counterparty_type'] == null
            ? null
            : counterpartyTypeEnumMapper[json['counterparty_type']],
        country: json['country'],
        createdTime: getDateTime(json['created_time']),
        daysUntilArchive: json['days_until_archive'],
        deleted: json['deleted'],
        description: json['description'],
        isActive: getBool(json['is_active']),
        isVisible: getBool(json['is_visible']),
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount']),
        maxOrderAmountDisplay: json['max_order_amount_display'],
        maxOrderAmountLimit: getDouble(json['max_order_amount_limit']),
        maxOrderAmountLimitDisplay: json['max_order_amount_limit_display'],
        minOrderAmount: getDouble(json['min_order_amount']),
        minOrderAmountDisplay: json['min_order_amount_display'],
        minOrderAmountLimit: getDouble(json['min_order_amount_limit']),
        minOrderAmountLimitDisplay: json['min_order_amount_limit_display'],
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
        price: getDouble(json['price']),
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate']),
        rateDisplay: json['rate_display'],
        remainingAmount: getDouble(json['remaining_amount']),
        remainingAmountDisplay: json['remaining_amount_display'],
        type: json['type'] == null
            ? null
            : p2pAdvertUpdateTypeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['id'] = id;
    resultMap['account_currency'] = accountCurrency;
    if (advertiserDetails != null) {
      resultMap['advertiser_details'] = advertiserDetails!.toJson();
    }
    resultMap['amount'] = amount;
    resultMap['amount_display'] = amountDisplay;
    resultMap['contact_info'] = contactInfo;
    resultMap['counterparty_type'] = counterpartyTypeEnumMapper.entries
        .firstWhere((MapEntry<String, CounterpartyTypeEnum> entry) =>
            entry.value == counterpartyType)
        .key;
    resultMap['country'] = country;
    resultMap['created_time'] = getSecondsSinceEpochDateTime(createdTime);
    resultMap['days_until_archive'] = daysUntilArchive;
    resultMap['deleted'] = deleted;
    resultMap['description'] = description;
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
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = p2pAdvertUpdateTypeEnumMapper.entries
        .firstWhere((MapEntry<String, P2pAdvertUpdateTypeEnum> entry) =>
            entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertUpdate copyWith({
    required String id,
    String? accountCurrency,
    AdvertiserDetails? advertiserDetails,
    double? amount,
    String? amountDisplay,
    String? contactInfo,
    CounterpartyTypeEnum? counterpartyType,
    String? country,
    DateTime? createdTime,
    int? daysUntilArchive,
    int? deleted,
    String? description,
    bool? isActive,
    bool? isVisible,
    String? localCurrency,
    double? maxOrderAmount,
    String? maxOrderAmountDisplay,
    double? maxOrderAmountLimit,
    String? maxOrderAmountLimitDisplay,
    double? minOrderAmount,
    String? minOrderAmountDisplay,
    double? minOrderAmountLimit,
    String? minOrderAmountLimitDisplay,
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
    double? price,
    String? priceDisplay,
    double? rate,
    String? rateDisplay,
    double? remainingAmount,
    String? remainingAmountDisplay,
    P2pAdvertUpdateTypeEnum? type,
  }) =>
      P2pAdvertUpdate(
        id: id,
        accountCurrency: accountCurrency ?? this.accountCurrency,
        advertiserDetails: advertiserDetails ?? this.advertiserDetails,
        amount: amount ?? this.amount,
        amountDisplay: amountDisplay ?? this.amountDisplay,
        contactInfo: contactInfo ?? this.contactInfo,
        counterpartyType: counterpartyType ?? this.counterpartyType,
        country: country ?? this.country,
        createdTime: createdTime ?? this.createdTime,
        daysUntilArchive: daysUntilArchive ?? this.daysUntilArchive,
        deleted: deleted ?? this.deleted,
        description: description ?? this.description,
        isActive: isActive ?? this.isActive,
        isVisible: isVisible ?? this.isVisible,
        localCurrency: localCurrency ?? this.localCurrency,
        maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
        maxOrderAmountDisplay:
            maxOrderAmountDisplay ?? this.maxOrderAmountDisplay,
        maxOrderAmountLimit: maxOrderAmountLimit ?? this.maxOrderAmountLimit,
        maxOrderAmountLimitDisplay:
            maxOrderAmountLimitDisplay ?? this.maxOrderAmountLimitDisplay,
        minOrderAmount: minOrderAmount ?? this.minOrderAmount,
        minOrderAmountDisplay:
            minOrderAmountDisplay ?? this.minOrderAmountDisplay,
        minOrderAmountLimit: minOrderAmountLimit ?? this.minOrderAmountLimit,
        minOrderAmountLimitDisplay:
            minOrderAmountLimitDisplay ?? this.minOrderAmountLimitDisplay,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
        paymentMethodNames: paymentMethodNames ?? this.paymentMethodNames,
        price: price ?? this.price,
        priceDisplay: priceDisplay ?? this.priceDisplay,
        rate: rate ?? this.rate,
        rateDisplay: rateDisplay ?? this.rateDisplay,
        remainingAmount: remainingAmount ?? this.remainingAmount,
        remainingAmountDisplay:
            remainingAmountDisplay ?? this.remainingAmountDisplay,
        type: type ?? this.type,
      );
}
/// Advertiser details model class.
abstract class AdvertiserDetailsModel {
  /// Initializes Advertiser details model class .
  AdvertiserDetailsModel({
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
  AdvertiserDetails({
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

  /// Indicates if this method is available on adverts.
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
  final TypeEnum type;

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
}
