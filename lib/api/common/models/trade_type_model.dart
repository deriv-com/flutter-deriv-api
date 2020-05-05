import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Trade type model class
class TradeTypeModel extends APIBaseModel {
  /// Initializes
  TradeTypeModel({
    this.displayName,
    this.name,
  });

  /// Creates an instance from json
  factory TradeTypeModel.fromJson(Map<String, dynamic> json) => TradeTypeModel(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Translated trade type name.
  final String displayName;

  /// Trade type name.
  final String name;

  /// Creates a copy of instance with given parameters
  TradeTypeModel copyWith({
    String displayName,
    String name,
  }) =>
      TradeTypeModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );
}
