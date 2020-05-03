import 'package:flutter_deriv_api/api/models/market_limit_model.dart';

import 'base_model.dart';

/// Contains limitation information for a market
class AccountMarketLimitsModel extends BaseModel {
  /// Initializes
  AccountMarketLimitsModel({this.marketName, this.marketLimits});

  /// Creates instance from Json
  factory AccountMarketLimitsModel.fromJson(
    String marketName,
    List<dynamic> jsonList,
  ) =>
      AccountMarketLimitsModel(
        marketName: marketName,
        marketLimits: jsonList == null
            ? null
            : jsonList
                .map<MarketLimitModel>(
                    (dynamic item) => MarketLimitModel.fromJson(item))
                .toList(),
      );

  /// Market name
  final String marketName;

  /// Limitations for [marketName]
  final List<MarketLimitModel> marketLimits;

  /// Clones a new instance
  AccountMarketLimitsModel copyWith({
    String marketName,
    final List<MarketLimitModel> marketLimits,
  }) =>
      AccountMarketLimitsModel(
        marketName: marketName ?? this.marketName,
        marketLimits: marketLimits ?? this.marketLimits,
      );
}
