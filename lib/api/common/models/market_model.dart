import 'package:flutter_deriv_api/api/common/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

/// Market class
class MarketModel extends APIBaseModel {
  /// Initializes
  MarketModel({
    this.displayName,
    this.name,
    this.submarkets,
  });

  /// Creates an instance from JSON
  factory MarketModel.fromJson(Map<String, dynamic> json) => MarketModel(
        displayName: json['display_name'],
        name: json['name'],
        submarkets: getListFromMap(
          json['submarkets'],
          itemToTypeCallback: (dynamic item) => SubmarketModel.fromJson(item),
        ),
      );

  /// Translated market name.
  final String? displayName;

  /// Market name.
  final String? name;

  /// Submarkets
  List<SubmarketModel?>? submarkets;

  /// Creates a copy of instance with given parameters
  MarketModel copyWith({
    String? displayName,
    String? name,
    String? submarkets,
  }) =>
      MarketModel(
        displayName: displayName ?? this.displayName,
        name: name ?? this.name,
        submarkets: submarkets as List<SubmarketModel?>? ?? this.submarkets,
      );
}
