import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Landing company currency config model class
class LandingCompanyCurrencyConfigModel extends APIBaseModel {
  /// Initializes
  LandingCompanyCurrencyConfigModel({
    this.code,
    this.maxPayout,
    this.minStake,
  });

  /// Creates instance from JSON
  factory LandingCompanyCurrencyConfigModel.fromJson(
    String code,
    Map<String, dynamic> currencyMap,
  ) =>
      LandingCompanyCurrencyConfigModel(
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
