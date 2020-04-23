import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/submarket_model.dart';

/// Market class
class MarketModel extends BaseModel {
  /// Class constructor
  MarketModel({
    this.displayName,
    this.name,
    this.submarkets,
  });

  /// Creates instance from json
  factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
        displayName: json['display_name'],
        name: json['name'],
        submarkets: json['submarkets'] == null
            ? null
            : json['submarkets']
                .map<SubmarketModel>(
                    (dynamic item) => SubmarketModel.fromJson(item))
                .toList(),
      );

  /// Translated market name.
  final String displayName;

  /// Market name.
  final String name;

  /// Submarkets
  List<SubmarketModel> submarkets;

  /// Creates copy of instance with given parameters
  MarketModel copyWith({
    String displayName,
    String name,
    String submarkets,
  }) =>
      MarketModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
        submarkets: submarkets ?? this.submarkets,
      );
}
