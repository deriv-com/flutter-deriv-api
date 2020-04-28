import 'base_model.dart';

/// Market Currency
class MarketCurrencyModel extends BaseModel {
  /// Initializes
  MarketCurrencyModel({
    this.maxPayout,
    this.minStake,
  });

  /// Instance from JSON
  factory MarketCurrencyModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      MarketCurrencyModel(
        maxPayout: json['max_payout']?.toDouble(),
        minStake: json['min_stake'],
      );

  /// Maximum payout for this currency in this market.
  final double maxPayout;

  /// Minimum stake for this currency in this market.
  final int minStake;

  /// Creates a new instance with give parameters
  MarketCurrencyModel copyWith({
    double maxPayout,
    int minStake,
  }) =>
      MarketCurrencyModel(
        maxPayout: maxPayout ?? this.maxPayout,
        minStake: minStake ?? this.minStake,
      );
}
