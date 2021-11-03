// ignore_for_file: prefer_single_quotes

import 'package:equatable/equatable.dart';


/// P2p payment methods response model class.
abstract class P2pPaymentMethodsResponseModel extends Equatable {
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

  /// Creates a copy of instance with given parameters.
  P2pPaymentMethodsResponse copyWith({
    Map<String, P2pPaymentMethodsProperty>? p2pPaymentMethods,
  }) =>
      P2pPaymentMethodsResponse(
        p2pPaymentMethods: p2pPaymentMethods ?? this.p2pPaymentMethods,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
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
/// P2p payment methods property model class.
abstract class P2pPaymentMethodsPropertyModel extends Equatable {
  /// Initializes P2p payment methods property model class .
  const P2pPaymentMethodsPropertyModel({
    required this.fields,
    required this.displayName,
  });

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
  }) : super(
          displayName: displayName,
          fields: fields,
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
      );

  /// Converts an instance to JSON.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['display_name'] = displayName;
    resultMap['fields'] = fields;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  P2pPaymentMethodsProperty copyWith({
    required String displayName,
    required Map<String, FieldsProperty> fields,
  }) =>
      P2pPaymentMethodsProperty(
        displayName: displayName,
        fields: fields,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
/// Fields property model class.
abstract class FieldsPropertyModel extends Equatable {
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
    required String displayName,
    required int required,
    required TypeEnum type,
  }) =>
      FieldsProperty(
        displayName: displayName,
        required: required,
        type: type,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
