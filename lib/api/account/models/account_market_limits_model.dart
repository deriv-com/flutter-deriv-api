import 'package:flutter_deriv_api/api/account/models/market_limit_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Contains limitation information for a market
class AccountMarketLimitsModel extends APIBaseModel {
  /// Initializes
  AccountMarketLimitsModel({this.marketName, this.marketLimits});

  /// Generates an instance from json
  factory AccountMarketLimitsModel.fromJson(
    String marketName,
    List<dynamic> jsonList,
  ) =>
      AccountMarketLimitsModel(
        marketName: marketName,
        marketLimits: getListFromMap(
          jsonList,
          itemToTypeCallback: (dynamic item) => MarketLimitModel.fromJson(item),
        ),
      );

  /// Market name
  final String marketName;

  /// Limitations for [marketName]
  final List<MarketLimitModel> marketLimits;

  /// Generates a copy of instance with given parameters
  AccountMarketLimitsModel copyWith({
    String marketName,
    final List<MarketLimitModel> marketLimits,
  }) =>
      AccountMarketLimitsModel(
        marketName: marketName ?? this.marketName,
        marketLimits: marketLimits ?? this.marketLimits,
      );
}
