import 'base_model.dart';

/// Landing company currency config model class
class LCCurrencyConfig extends BaseModel {
  /// Initializes
  LCCurrencyConfig({
    this.code,
    this.maxPayout,
    this.minStake,
  });

  /// Creates instance from JSON
  factory LCCurrencyConfig.fromJson(
    String code,
    Map<String, dynamic> currencyMap,
  ) =>
      LCCurrencyConfig(
        code: code,
        maxPayout: currencyMap['max_payout']?.toDouble(),
        minStake: currencyMap['min_stake']?.toDouble(),
      );

  /// Code of the currency
  final String code;

  /// Currency's max payout
  final double maxPayout;

  /// Currency's min stake
  final double minStake;
}
