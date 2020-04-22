import 'package:flutter_deriv_api/api/models/base_model.dart';

/// Market class
class MarketModel extends BaseModel {
  /// Class constructor
  MarketModel({
    this.displayName,
    this.name,
  });

  /// Creates instance from json
  factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
        displayName: json['display_name'],
        name: json['name'],
      );

  /// Translated market name.
  final String displayName;

  /// Market name.
  final String name;

  /// Creates copy of instance with given parameters
  MarketModel copyWith({
    String displayName,
    String name,
  }) =>
      MarketModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
      );
}
