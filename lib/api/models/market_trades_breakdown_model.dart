import 'api_base_model.dart';

/// Represents the portfolio distribution by [market].
class MarketTradesBreakdownModel extends APIBaseModel {
  /// Initializes
  MarketTradesBreakdownModel({this.market, this.breakdown});

  /// From JSON
  factory MarketTradesBreakdownModel.fromJson(
    MapEntry<String, dynamic> entry,
  ) =>
      MarketTradesBreakdownModel(
        market: entry.key,
        breakdown: entry.value,
      );

  /// Breakdown
  final double breakdown;

  /// Market name
  final String market;

  /// Clones a new instance
  MarketTradesBreakdownModel copyWith({
    double breakdown,
    String market,
  }) =>
      MarketTradesBreakdownModel(
        breakdown: breakdown ?? this.breakdown,
        market: market ?? this.market,
      );
}
