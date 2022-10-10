// ignore_for_file: prefer_single_quotes, unnecessary_import, unused_import

import 'package:equatable/equatable.dart';


import 'package:flutter_deriv_api/api/exceptions/exceptions.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_payment_methods_receive.dart';
import 'package:flutter_deriv_api/basic_api/generated/p2p_payment_methods_send.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

/// P2p payment methods response model class.
abstract class P2pPaymentMethodsResponseModel {
  /// Initializes P2p payment methods response model class .
  const P2pPaymentMethodsResponseModel({
    this.p2pPaymentMethods,
  });

  /// Payment methods keyed by identifier.
  final Map<String, P2pPaymentMethodsProperty>? p2pPaymentMethods;
}

/// P2p payment methods response class.
class P2pPaymentMethodsResponse extends P2pPaymentMethodsResponseModel {
  /// Initializes P2p payment methods response class.
  const P2pPaymentMethodsResponse({
    Map<String, P2pPaymentMethodsProperty>? p2pPaymentMethods,
  }) : super(
          p2pPaymentMethods: p2pPaymentMethods,
        );

  /// Creates an instance from JSON.
  factory P2pPaymentMethodsResponse.fromJson(
    dynamic p2pPaymentMethodsJson,
  ) =>
      P2pPaymentMethodsResponse(
        p2pPaymentMethods: p2pPaymentMethodsJson == null
            ? null
            : Map<String, P2pPaymentMethodsProperty>.fromEntries(
                p2pPaymentMethodsJson.entries.map<
                        MapEntry<String, P2pPaymentMethodsProperty>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, P2pPaymentMethodsProperty>(entry.key,
                            P2pPaymentMethodsProperty.fromJson(entry.value)))),
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['p2p_payment_methods'] = p2pPaymentMethods;

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// List all P2P payment methods.
  Future<P2pPaymentMethodsResponse> fetch(
    P2pPaymentMethodsRequest request,
  ) async {
    final P2pPaymentMethodsReceive response = await fetchRaw(request);

    return P2pPaymentMethodsResponse.fromJson(response.p2pPaymentMethods);
  }

  /// Dispute a P2P order.
  Future<P2pPaymentMethodsReceive> fetchRaw(
    P2pPaymentMethodsRequest request,
  ) async {
    final P2pPaymentMethodsReceive response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          P2POrderException(baseExceptionModel: baseExceptionModel),
    );

    return response;
  }

  /// Creates a copy of instance with given parameters.
  P2pPaymentMethodsResponse copyWith({
    Map<String, P2pPaymentMethodsProperty>? p2pPaymentMethods,
  }) =>
      P2pPaymentMethodsResponse(
        p2pPaymentMethods: p2pPaymentMethods ?? this.p2pPaymentMethods,
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

/// P2pPaymentMethodsPropertyTypeEnum mapper.
final Map<String, P2pPaymentMethodsPropertyTypeEnum>
    p2pPaymentMethodsPropertyTypeEnumMapper =
    <String, P2pPaymentMethodsPropertyTypeEnum>{
  "bank": P2pPaymentMethodsPropertyTypeEnum.bank,
  "ewallet": P2pPaymentMethodsPropertyTypeEnum.ewallet,
  "other": P2pPaymentMethodsPropertyTypeEnum.other,
};

/// Type Enum.
enum P2pPaymentMethodsPropertyTypeEnum {
  /// bank.
  bank,

  /// ewallet.
  ewallet,

  /// other.
  other,
}
/// P2p payment methods property model class.
abstract class P2pPaymentMethodsPropertyModel {
  /// Initializes P2p payment methods property model class .
  const P2pPaymentMethodsPropertyModel({
    required this.type,
    required this.fields,
    required this.displayName,
  });

  /// Payment method type.
  final P2pPaymentMethodsPropertyTypeEnum type;

  /// Payment method field definitions.
  final Map<String, FieldsProperty> fields;

  /// Display name of payment method.
  final String displayName;
}

/// P2p payment methods property class.
class P2pPaymentMethodsProperty extends P2pPaymentMethodsPropertyModel {
  /// Initializes P2p payment methods property class.
  const P2pPaymentMethodsProperty({
    required String displayName,
    required Map<String, FieldsProperty> fields,
    required P2pPaymentMethodsPropertyTypeEnum type,
  }) : super(
          displayName: displayName,
          fields: fields,
          type: type,
        );

  /// Creates an instance from JSON.
  factory P2pPaymentMethodsProperty.fromJson(Map<String, dynamic> json) =>
      P2pPaymentMethodsProperty(
        displayName: json['display_name'],
        fields: Map<String, FieldsProperty>.fromEntries(json['fields']
            .entries
            .map<MapEntry<String, FieldsProperty>>(
                (MapEntry<String, dynamic> entry) =>
                    MapEntry<String, FieldsProperty>(
                        entry.key, FieldsProperty.fromJson(entry.value)))),
        type: p2pPaymentMethodsPropertyTypeEnumMapper[json['type']]!,
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['fields'] = fields;
    resultMap['type'] = p2pPaymentMethodsPropertyTypeEnumMapper.entries
        .firstWhere(
            (MapEntry<String, P2pPaymentMethodsPropertyTypeEnum> entry) =>
                entry.value == type)
        .key;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pPaymentMethodsProperty copyWith({
    String? displayName,
    Map<String, FieldsProperty>? fields,
    P2pPaymentMethodsPropertyTypeEnum? type,
  }) =>
      P2pPaymentMethodsProperty(
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
    required String displayName,
    required int required,
    required TypeEnum type,
  }) : super(
          displayName: displayName,
          required: required,
          type: type,
        );

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
