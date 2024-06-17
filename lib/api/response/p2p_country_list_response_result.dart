// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/helpers/helpers.dart';

/// P2p country list response model class.
abstract class P2pCountryListResponseModel {
  /// Initializes P2p country list response model class .
  const P2pCountryListResponseModel({
    this.p2pCountryList,
  });

  /// Country identified by country code
  final Map<String, P2pCountryListProperty>? p2pCountryList;
}

/// P2p country list response class.
class P2pCountryListResponse extends P2pCountryListResponseModel {
  /// Initializes P2p country list response class.
  const P2pCountryListResponse({
    super.p2pCountryList,
  });

  /// Creates an instance from JSON.
  factory P2pCountryListResponse.fromJson(
    dynamic p2pCountryListJson,
  ) =>
      P2pCountryListResponse(
        p2pCountryList: p2pCountryListJson == null
            ? null
            : Map<String, P2pCountryListProperty>.fromEntries(p2pCountryListJson
                .entries
                .map<MapEntry<String, P2pCountryListProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, P2pCountryListProperty>(entry.key,
                            P2pCountryListProperty.fromJson(entry.value)))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['p2p_country_list'] = p2pCountryList;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pCountryListResponse copyWith({
    Map<String, P2pCountryListProperty>? p2pCountryList,
  }) =>
      P2pCountryListResponse(
        p2pCountryList: p2pCountryList ?? this.p2pCountryList,
      );
}

/// FixedRateAdvertsEnum mapper.
final Map<String, FixedRateAdvertsEnum> fixedRateAdvertsEnumMapper =
    <String, FixedRateAdvertsEnum>{
  "disabled": FixedRateAdvertsEnum.disabled,
  "enabled": FixedRateAdvertsEnum.enabled,
  "list_only": FixedRateAdvertsEnum.listOnly,
};

/// FixedRateAdverts Enum.
enum FixedRateAdvertsEnum {
  /// disabled.
  disabled,

  /// enabled.
  enabled,

  /// list_only.
  listOnly,
}

/// FloatRateAdvertsEnum mapper.
final Map<String, FloatRateAdvertsEnum> floatRateAdvertsEnumMapper =
    <String, FloatRateAdvertsEnum>{
  "disabled": FloatRateAdvertsEnum.disabled,
  "enabled": FloatRateAdvertsEnum.enabled,
  "list_only": FloatRateAdvertsEnum.listOnly,
};

/// FloatRateAdverts Enum.
enum FloatRateAdvertsEnum {
  /// disabled.
  disabled,

  /// enabled.
  enabled,

  /// list_only.
  listOnly,
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

/// PaymentMethodsPropertyTypeEnum mapper.
final Map<String, PaymentMethodsPropertyTypeEnum>
    paymentMethodsPropertyTypeEnumMapper =
    <String, PaymentMethodsPropertyTypeEnum>{
  "bank": PaymentMethodsPropertyTypeEnum.bank,
  "ewallet": PaymentMethodsPropertyTypeEnum.ewallet,
  "other": PaymentMethodsPropertyTypeEnum.other,
};

/// Type Enum.
enum PaymentMethodsPropertyTypeEnum {
  /// bank.
  bank,

  /// ewallet.
  ewallet,

  /// other.
  other,
}
/// P2p country list property model class.
abstract class P2pCountryListPropertyModel {
  /// Initializes P2p country list property model class .
  const P2pCountryListPropertyModel({
    required this.paymentMethods,
    required this.localCurrency,
    required this.floatRateOffsetLimit,
    required this.floatRateAdverts,
    required this.fixedRateAdverts,
    required this.crossBorderAdsEnabled,
    required this.countryName,
  });

  /// Payment method identifier.
  final Map<String, PaymentMethodsProperty> paymentMethods;

  /// Local currency of the country.
  final String localCurrency;

  /// Maximum rate offset for floating rate adverts.
  final double floatRateOffsetLimit;

  /// Availability of floating rate adverts.
  final FloatRateAdvertsEnum floatRateAdverts;

  /// Availability of fixed rate adverts.
  final FixedRateAdvertsEnum fixedRateAdverts;

  /// When `true`, users in this country may place orders on ads in other countries.
  final bool crossBorderAdsEnabled;

  /// Display name of country.
  final String countryName;
}

/// P2p country list property class.
class P2pCountryListProperty extends P2pCountryListPropertyModel {
  /// Initializes P2p country list property class.
  const P2pCountryListProperty({
    required super.countryName,
    required super.crossBorderAdsEnabled,
    required super.fixedRateAdverts,
    required super.floatRateAdverts,
    required super.floatRateOffsetLimit,
    required super.localCurrency,
    required super.paymentMethods,
  });

  /// Creates an instance from JSON.
  factory P2pCountryListProperty.fromJson(Map<String, dynamic> json) =>
      P2pCountryListProperty(
        countryName: json['country_name'],
        crossBorderAdsEnabled: getBool(json['cross_border_ads_enabled'])!,
        fixedRateAdverts:
            fixedRateAdvertsEnumMapper[json['fixed_rate_adverts']]!,
        floatRateAdverts:
            floatRateAdvertsEnumMapper[json['float_rate_adverts']]!,
        floatRateOffsetLimit: getDouble(json['float_rate_offset_limit'])!,
        localCurrency: json['local_currency'],
        paymentMethods: Map<String, PaymentMethodsProperty>.fromEntries(
            json['payment_methods']
                .entries
                .map<MapEntry<String, PaymentMethodsProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, PaymentMethodsProperty>(entry.key,
                            PaymentMethodsProperty.fromJson(entry.value)))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['country_name'] = countryName;
    resultMap['cross_border_ads_enabled'] = crossBorderAdsEnabled;
    resultMap['fixed_rate_adverts'] = fixedRateAdvertsEnumMapper.entries
        .firstWhere((MapEntry<String, FixedRateAdvertsEnum> entry) =>
            entry.value == fixedRateAdverts)
        .key;
    resultMap['float_rate_adverts'] = floatRateAdvertsEnumMapper.entries
        .firstWhere((MapEntry<String, FloatRateAdvertsEnum> entry) =>
            entry.value == floatRateAdverts)
        .key;
    resultMap['float_rate_offset_limit'] = floatRateOffsetLimit;
    resultMap['local_currency'] = localCurrency;
    resultMap['payment_methods'] = paymentMethods;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pCountryListProperty copyWith({
    String? countryName,
    bool? crossBorderAdsEnabled,
    FixedRateAdvertsEnum? fixedRateAdverts,
    FloatRateAdvertsEnum? floatRateAdverts,
    double? floatRateOffsetLimit,
    String? localCurrency,
    Map<String, PaymentMethodsProperty>? paymentMethods,
  }) =>
      P2pCountryListProperty(
        countryName: countryName ?? this.countryName,
        crossBorderAdsEnabled:
            crossBorderAdsEnabled ?? this.crossBorderAdsEnabled,
        fixedRateAdverts: fixedRateAdverts ?? this.fixedRateAdverts,
        floatRateAdverts: floatRateAdverts ?? this.floatRateAdverts,
        floatRateOffsetLimit: floatRateOffsetLimit ?? this.floatRateOffsetLimit,
        localCurrency: localCurrency ?? this.localCurrency,
        paymentMethods: paymentMethods ?? this.paymentMethods,
      );
}
/// Payment methods property model class.
abstract class PaymentMethodsPropertyModel {
  /// Initializes Payment methods property model class .
  const PaymentMethodsPropertyModel({
    this.displayName,
    this.fields,
    this.type,
  });

  /// Display name of payment method.
  final String? displayName;

  /// Payment method field definitions.
  final Map<String, FieldsProperty>? fields;

  /// Payment method type.
  final PaymentMethodsPropertyTypeEnum? type;
}

/// Payment methods property class.
class PaymentMethodsProperty extends PaymentMethodsPropertyModel {
  /// Initializes Payment methods property class.
  const PaymentMethodsProperty({
    super.displayName,
    super.fields,
    super.type,
  });

  /// Creates an instance from JSON.
  factory PaymentMethodsProperty.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsProperty(
        displayName: json['display_name'],
        fields: json['fields'] == null
            ? null
            : Map<String, FieldsProperty>.fromEntries(json['fields']
                .entries
                .map<MapEntry<String, FieldsProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, FieldsProperty>(
                            entry.key, FieldsProperty.fromJson(entry.value)))),
        type: json['type'] == null
            ? null
            : paymentMethodsPropertyTypeEnumMapper[json['type']],
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['fields'] = fields;
    resultMap['type'] = paymentMethodsPropertyTypeEnumMapper.entries
        .firstWhere((MapEntry<String, PaymentMethodsPropertyTypeEnum> entry) =>
            entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  PaymentMethodsProperty copyWith({
    String? displayName,
    Map<String, FieldsProperty>? fields,
    PaymentMethodsPropertyTypeEnum? type,
  }) =>
      PaymentMethodsProperty(
        displayName: displayName ?? this.displayName,
        fields: fields ?? this.fields,
        type: type ?? this.type,
      );
}
/// Fields property model class.
abstract class FieldsPropertyModel {
  /// Initializes Fields property model class .
  const FieldsPropertyModel({
    required this.type,
    required this.required,
    required this.displayName,
  });

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
    required super.displayName,
    required super.required,
    required super.type,
  });

  /// Creates an instance from JSON.
  factory FieldsProperty.fromJson(Map<String, dynamic> json) => FieldsProperty(
        displayName: json['display_name'],
        required: json['required'],
        type: typeEnumMapper[json['type']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['required'] = required;
    resultMap['type'] = typeEnumMapper.entries
        .firstWhere((MapEntry<String, TypeEnum> entry) => entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  FieldsProperty copyWith({
    String? displayName,
    int? required,
    TypeEnum? type,
  }) =>
      FieldsProperty(
        displayName: displayName ?? this.displayName,
        required: required ?? this.required,
        type: type ?? this.type,
      );
}
