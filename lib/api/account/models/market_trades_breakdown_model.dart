import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Represents the portfolio distribution by [market].
class MarketTradesBreakdownModel extends APIBaseModel {
  /// Initializes
  MarketTradesBreakdownModel({this.market, this.breakdown});

  /// Generate an instance from JSON
  factory MarketTradesBreakdownModel.fromJson(
    MapEntry<String, dynamic> entry,
  ) =>
      MarketTradesBreakdownModel(
        market: entry.key,
        breakdown: entry.value,
      );

  /// Breakdown
  final double? breakdown;

  /// Market name
  final String? market;

  /// Generate a copy of instance with given parameters
  MarketTradesBreakdownModel copyWith({
    double? breakdown,
    String? market,
  }) =>
      MarketTradesBreakdownModel(
        breakdown: breakdown ?? this.breakdown,
        market: market ?? this.market,
      );
}
