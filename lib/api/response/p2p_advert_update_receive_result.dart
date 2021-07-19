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

/// TypeEnum2 mapper.
final Map<String, TypeEnum2> typeEnum2Mapper = <String, TypeEnum2>{
  "buy": TypeEnum2.buy,
  "sell": TypeEnum2.sell,
};

/// Type Enum.
enum TypeEnum2 {
  /// buy.
  buy,

  /// sell.
  sell,
}
/// P2p advert update model class.
abstract class P2pAdvertUpdateModel {
  /// Initializes P2p advert update model class .
  P2pAdvertUpdateModel({
    required this.type,
    required this.remainingAmountDisplay,
    required this.remainingAmount,
    required this.rateDisplay,
    required this.rate,
    required this.priceDisplay,
    required this.price,
    required this.minOrderAmountDisplay,
    required this.minOrderAmount,
    required this.maxOrderAmountDisplay,
    required this.maxOrderAmount,
    required this.localCurrency,
    required this.isActive,
    required this.id,
    required this.description,
    required this.createdTime,
    required this.country,
    required this.counterpartyType,
    required this.amountDisplay,
    required this.amount,
    required this.advertiserDetails,
    required this.accountCurrency,
    this.contactInfo,
    this.daysUntilArchive,
    this.paymentInfo,
    this.paymentMethod,
    this.paymentMethodDetails,
    this.paymentMethodNames,
  });

  /// Whether this is a buy or a sell.
  final TypeEnum2 type;

  /// Amount currently available for orders, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String remainingAmountDisplay;

  /// Amount currently available for orders, in `account_currency`. It is only visible for advertisers.
  final double remainingAmount;

  /// Conversion rate from account currency to local currency, formatted to appropriate decimal places.
  final String rateDisplay;

  /// Conversion rate from account currency to local currency.
  final double rate;

  /// Cost of the advert in local currency, formatted to appropriate decimal places.
  final String priceDisplay;

  /// Cost of the advert in local currency.
  final double price;

  /// Minimum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String minOrderAmountDisplay;

  /// Minimum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double minOrderAmount;

  /// Maximum order amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String maxOrderAmountDisplay;

  /// Maximum order amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double maxOrderAmount;

  /// Local currency for this advert. This is the form of payment to be arranged directly between advertiser and client.
  final String localCurrency;

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

  /// The total amount specified in advert, in `account_currency`, formatted to appropriate decimal places. It is only visible for advertisers.
  final String amountDisplay;

  /// The total amount specified in advert, in `account_currency`. It is only visible for advertisers.
  final double amount;

  /// Details of the advertiser for this advert.
  final AdvertiserDetails advertiserDetails;

  /// Currency for this advert. This is the system currency to be transferred between advertiser and client.
  final String accountCurrency;

  /// Advertiser contact information. Only applicable for 'sell adverts'.
  final String? contactInfo;

  /// Days until automatic inactivation of this ad, if no activity occurs.
  final int? daysUntilArchive;

  /// Payment instructions. Only applicable for 'sell adverts'.
  final String? paymentInfo;

  /// Supported payment methods. Comma separated list of identifiers
  final String? paymentMethod;

  /// Details of available payment methods.
  final Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails;

  /// Names of supported payment methods.
  final List<String>? paymentMethodNames;
}

/// P2p advert update class.
class P2pAdvertUpdate extends P2pAdvertUpdateModel {
  /// Initializes P2p advert update class.
  P2pAdvertUpdate({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required String localCurrency,
    required double maxOrderAmount,
    required String maxOrderAmountDisplay,
    required double minOrderAmount,
    required String minOrderAmountDisplay,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required TypeEnum2 type,
    String? contactInfo,
    int? daysUntilArchive,
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
  }) : super(
          accountCurrency: accountCurrency,
          advertiserDetails: advertiserDetails,
          amount: amount,
          amountDisplay: amountDisplay,
          counterpartyType: counterpartyType,
          country: country,
          createdTime: createdTime,
          description: description,
          id: id,
          isActive: isActive,
          localCurrency: localCurrency,
          maxOrderAmount: maxOrderAmount,
          maxOrderAmountDisplay: maxOrderAmountDisplay,
          minOrderAmount: minOrderAmount,
          minOrderAmountDisplay: minOrderAmountDisplay,
          price: price,
          priceDisplay: priceDisplay,
          rate: rate,
          rateDisplay: rateDisplay,
          remainingAmount: remainingAmount,
          remainingAmountDisplay: remainingAmountDisplay,
          type: type,
          contactInfo: contactInfo,
          daysUntilArchive: daysUntilArchive,
          paymentInfo: paymentInfo,
          paymentMethod: paymentMethod,
          paymentMethodDetails: paymentMethodDetails,
          paymentMethodNames: paymentMethodNames,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertUpdate.fromJson(Map<String, dynamic> json) =>
      P2pAdvertUpdate(
        accountCurrency: json['account_currency'],
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
        localCurrency: json['local_currency'],
        maxOrderAmount: getDouble(json['max_order_amount'])!,
        maxOrderAmountDisplay: json['max_order_amount_display'],
        minOrderAmount: getDouble(json['min_order_amount'])!,
        minOrderAmountDisplay: json['min_order_amount_display'],
        price: getDouble(json['price'])!,
        priceDisplay: json['price_display'],
        rate: getDouble(json['rate'])!,
        rateDisplay: json['rate_display'],
        remainingAmount: getDouble(json['remaining_amount'])!,
        remainingAmountDisplay: json['remaining_amount_display'],
        type: typeEnum2Mapper[json['type']]!,
        contactInfo: json['contact_info'],
        daysUntilArchive: json['days_until_archive'],
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
    resultMap['local_currency'] = localCurrency;
    resultMap['max_order_amount'] = maxOrderAmount;
    resultMap['max_order_amount_display'] = maxOrderAmountDisplay;
    resultMap['min_order_amount'] = minOrderAmount;
    resultMap['min_order_amount_display'] = minOrderAmountDisplay;
    resultMap['price'] = price;
    resultMap['price_display'] = priceDisplay;
    resultMap['rate'] = rate;
    resultMap['rate_display'] = rateDisplay;
    resultMap['remaining_amount'] = remainingAmount;
    resultMap['remaining_amount_display'] = remainingAmountDisplay;
    resultMap['type'] = typeEnum2Mapper.entries
        .firstWhere((MapEntry<String, TypeEnum2> entry) => entry.value == type)
        .key;
    resultMap['contact_info'] = contactInfo;
    resultMap['days_until_archive'] = daysUntilArchive;
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
  P2pAdvertUpdate copyWith({
    required String accountCurrency,
    required AdvertiserDetails advertiserDetails,
    required double amount,
    required String amountDisplay,
    required CounterpartyTypeEnum counterpartyType,
    required String country,
    required DateTime createdTime,
    required String description,
    required String id,
    required bool isActive,
    required String localCurrency,
    required double maxOrderAmount,
    required String maxOrderAmountDisplay,
    required double minOrderAmount,
    required String minOrderAmountDisplay,
    required double price,
    required String priceDisplay,
    required double rate,
    required String rateDisplay,
    required double remainingAmount,
    required String remainingAmountDisplay,
    required TypeEnum2 type,
    String? contactInfo,
    int? daysUntilArchive,
    String? paymentInfo,
    String? paymentMethod,
    Map<String, PaymentMethodDetailsProperty>? paymentMethodDetails,
    List<String>? paymentMethodNames,
  }) =>
      P2pAdvertUpdate(
        accountCurrency: accountCurrency,
        advertiserDetails: advertiserDetails,
        amount: amount,
        amountDisplay: amountDisplay,
        counterpartyType: counterpartyType,
        country: country,
        createdTime: createdTime,
        description: description,
        id: id,
        isActive: isActive,
        localCurrency: localCurrency,
        maxOrderAmount: maxOrderAmount,
        maxOrderAmountDisplay: maxOrderAmountDisplay,
        minOrderAmount: minOrderAmount,
        minOrderAmountDisplay: minOrderAmountDisplay,
        price: price,
        priceDisplay: priceDisplay,
        rate: rate,
        rateDisplay: rateDisplay,
        remainingAmount: remainingAmount,
        remainingAmountDisplay: remainingAmountDisplay,
        type: type,
        contactInfo: contactInfo ?? this.contactInfo,
        daysUntilArchive: daysUntilArchive ?? this.daysUntilArchive,
        paymentInfo: paymentInfo ?? this.paymentInfo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        paymentMethodDetails: paymentMethodDetails ?? this.paymentMethodDetails,
        paymentMethodNames: paymentMethodNames ?? this.paymentMethodNames,
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
