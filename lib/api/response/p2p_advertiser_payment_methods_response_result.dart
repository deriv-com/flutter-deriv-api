// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';

import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_payment_methods_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_advertiser_payment_methods_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:deriv_dependency_injector/dependency_injector.dart';

/// P2p advertiser payment methods response model class.
abstract class P2pAdvertiserPaymentMethodsResponseModel {
  /// Initializes P2p advertiser payment methods response model class .
  const P2pAdvertiserPaymentMethodsResponseModel({
    this.p2pAdvertiserPaymentMethods,
  });

  /// List of current methods.
  final Map<String, P2pAdvertiserPaymentMethodsProperty>?
      p2pAdvertiserPaymentMethods;
}

/// P2p advertiser payment methods response class.
class P2pAdvertiserPaymentMethodsResponse
    extends P2pAdvertiserPaymentMethodsResponseModel {
  /// Initializes P2p advertiser payment methods response class.
  const P2pAdvertiserPaymentMethodsResponse({
    Map<String, P2pAdvertiserPaymentMethodsProperty>?
        p2pAdvertiserPaymentMethods,
  }) : super(
          p2pAdvertiserPaymentMethods: p2pAdvertiserPaymentMethods,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserPaymentMethodsResponse.fromJson(
    dynamic p2pAdvertiserPaymentMethodsJson,
  ) =>
      P2pAdvertiserPaymentMethodsResponse(
        p2pAdvertiserPaymentMethods: p2pAdvertiserPaymentMethodsJson == null
            ? null
            : Map<String, P2pAdvertiserPaymentMethodsProperty>.fromEntries(
                p2pAdvertiserPaymentMethodsJson.entries.map<
                        MapEntry<String, P2pAdvertiserPaymentMethodsProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, P2pAdvertiserPaymentMethodsProperty>(
                            entry.key,
                            P2pAdvertiserPaymentMethodsProperty.fromJson(
                                entry.value)))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['p2p_advertiser_payment_methods'] = p2pAdvertiserPaymentMethods;

    return resultMap;
  }

  static final BaseAPI _api = Injector().get<BaseAPI>()!;

  /// Manage or list P2P advertiser payment methods.
  ///
  /// For parameters information refer to [P2pAdvertiserPaymentMethodsRequest].
  /// Throws an [P2PAdvertiserException] if API response contains an error.
  static Future<P2pAdvertiserPaymentMethodsReceive> fetchMethodsRaw(
    P2pAdvertiserPaymentMethodsRequest request,
  ) async {
    final P2pAdvertiserPaymentMethodsReceive response =
        await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2PAdvertiserException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Manage or list P2P advertiser payment methods.
  ///
  /// For parameters information refer to [P2pAdvertiserPaymentMethodsRequest].
  /// Throws an [P2PAdvertiserException] if API response contains an error.
  static Future<P2pAdvertiserPaymentMethodsResponse> fetchMethods(
    P2pAdvertiserPaymentMethodsRequest request,
  ) async {
    final P2pAdvertiserPaymentMethodsReceive response =
        await fetchMethodsRaw(request);

    return P2pAdvertiserPaymentMethodsResponse.fromJson(
      response.p2pAdvertiserPaymentMethods,
    );
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserPaymentMethodsResponse copyWith({
    Map<String, P2pAdvertiserPaymentMethodsProperty>?
        p2pAdvertiserPaymentMethods,
  }) =>
      P2pAdvertiserPaymentMethodsResponse(
        p2pAdvertiserPaymentMethods:
            p2pAdvertiserPaymentMethods ?? this.p2pAdvertiserPaymentMethods,
      );
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

/// P2pAdvertiserPaymentMethodsPropertyTypeEnum mapper.
final Map<String, P2pAdvertiserPaymentMethodsPropertyTypeEnum>
    p2pAdvertiserPaymentMethodsPropertyTypeEnumMapper =
    <String, P2pAdvertiserPaymentMethodsPropertyTypeEnum>{
  "bank": P2pAdvertiserPaymentMethodsPropertyTypeEnum.bank,
  "ewallet": P2pAdvertiserPaymentMethodsPropertyTypeEnum.ewallet,
  "other": P2pAdvertiserPaymentMethodsPropertyTypeEnum.other,
};

/// Type Enum.
enum P2pAdvertiserPaymentMethodsPropertyTypeEnum {
  /// bank.
  bank,

  /// ewallet.
  ewallet,

  /// other.
  other,
}

/// P2p advertiser payment methods property model class.
abstract class P2pAdvertiserPaymentMethodsPropertyModel {
  /// Initializes P2p advertiser payment methods property model class .
  const P2pAdvertiserPaymentMethodsPropertyModel({
    required this.type,
    required this.method,
    required this.isEnabled,
    required this.fields,
    this.displayName,
    this.usedByAdverts,
    this.usedByOrders,
  });

  /// Payment method type.
  final P2pAdvertiserPaymentMethodsPropertyTypeEnum type;

  /// Payment method identifier.
  final String method;

  /// Indicates if this method is available on adverts and orders.
  final bool isEnabled;

  /// Payment method fields.
  final Map<String, FieldsProperty> fields;

  /// Display name of payment method.
  final String? displayName;

  /// IDs of adverts that use this payment method.
  final List<String>? usedByAdverts;

  /// IDs of orders that use this payment method.
  final List<String>? usedByOrders;
}

/// P2p advertiser payment methods property class.
class P2pAdvertiserPaymentMethodsProperty
    extends P2pAdvertiserPaymentMethodsPropertyModel {
  /// Initializes P2p advertiser payment methods property class.
  const P2pAdvertiserPaymentMethodsProperty({
    required Map<String, FieldsProperty> fields,
    required bool isEnabled,
    required String method,
    required P2pAdvertiserPaymentMethodsPropertyTypeEnum type,
    String? displayName,
    List<String>? usedByAdverts,
    List<String>? usedByOrders,
  }) : super(
          fields: fields,
          isEnabled: isEnabled,
          method: method,
          type: type,
          displayName: displayName,
          usedByAdverts: usedByAdverts,
          usedByOrders: usedByOrders,
        );

  /// Creates an instance from JSON.
  factory P2pAdvertiserPaymentMethodsProperty.fromJson(
          Map<String, dynamic> json) =>
      P2pAdvertiserPaymentMethodsProperty(
        fields: Map<String, FieldsProperty>.fromEntries(json['fields']
            .entries
            .map<MapEntry<String, FieldsProperty>>(
                (MapEntry<String, dynamic> entry) =>
                    MapEntry<String, FieldsProperty>(
                        entry.key, FieldsProperty.fromJson(entry.value)))),
        isEnabled: getBool(json['is_enabled'])!,
        method: json['method'],
        type: p2pAdvertiserPaymentMethodsPropertyTypeEnumMapper[json['type']]!,
        displayName: json['display_name'],
        usedByAdverts: json['used_by_adverts'] == null
            ? null
            : List<String>.from(
                json['used_by_adverts']?.map(
                  (dynamic item) => item,
                ),
              ),
        usedByOrders: json['used_by_orders'] == null
            ? null
            : List<String>.from(
                json['used_by_orders']?.map(
                  (dynamic item) => item,
                ),
              ),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['fields'] = fields;
    resultMap['is_enabled'] = isEnabled;
    resultMap['method'] = method;
    resultMap['type'] = p2pAdvertiserPaymentMethodsPropertyTypeEnumMapper
        .entries
        .firstWhere(
            (MapEntry<String, P2pAdvertiserPaymentMethodsPropertyTypeEnum>
                    entry) =>
                entry.value == type)
        .key;
    resultMap['display_name'] = displayName;
    if (usedByAdverts != null) {
      resultMap['used_by_adverts'] = usedByAdverts!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }
    if (usedByOrders != null) {
      resultMap['used_by_orders'] = usedByOrders!
          .map<dynamic>(
            (String item) => item,
          )
          .toList();
    }

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pAdvertiserPaymentMethodsProperty copyWith({
    Map<String, FieldsProperty>? fields,
    bool? isEnabled,
    String? method,
    P2pAdvertiserPaymentMethodsPropertyTypeEnum? type,
    String? displayName,
    List<String>? usedByAdverts,
    List<String>? usedByOrders,
  }) =>
      P2pAdvertiserPaymentMethodsProperty(
        fields: fields ?? this.fields,
        isEnabled: isEnabled ?? this.isEnabled,
        method: method ?? this.method,
        type: type ?? this.type,
        displayName: displayName ?? this.displayName,
        usedByAdverts: usedByAdverts ?? this.usedByAdverts,
        usedByOrders: usedByOrders ?? this.usedByOrders,
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
    String? displayName,
    int? required,
    TypeEnum? type,
    String? value,
  }) =>
      FieldsProperty(
        displayName: displayName ?? this.displayName,
        required: required ?? this.required,
        type: type ?? this.type,
        value: value ?? this.value,
      );
}
