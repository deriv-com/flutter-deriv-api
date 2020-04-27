import 'package:flutter_deriv_api/api/models/account_market_limits_model.dart';

import 'base_model.dart';

/// Contains limitation information for each market.
class AccountMarketSpecificModel extends BaseModel {
  /// Initializes
  AccountMarketSpecificModel({
    this.commoditiesLimits,
    this.forexLimits,
    this.indicesLimits,
    this.syntheticIndexLimits,
  });

  /// From JSON
  factory AccountMarketSpecificModel.fromJson(Map<String, dynamic> json) =>
      AccountMarketSpecificModel(
        commoditiesLimits: json['commodities'] == null
            ? null
            : json['commodities']
                .map<AccountMarketLimitsModel>(
                    (dynamic entry) => AccountMarketLimitsModel.fromJson(entry))
                .toList(),
        forexLimits: json['forex'] == null
            ? null
            : json['forex']
                .map<AccountMarketLimitsModel>(
                    (dynamic entry) => AccountMarketLimitsModel.fromJson(entry))
                .toList(),
        indicesLimits: json['indices'] == null
            ? null
            : json['indices']
                .map<AccountMarketLimitsModel>(
                    (dynamic entry) => AccountMarketLimitsModel.fromJson(entry))
                .toList(),
        syntheticIndexLimits: json['synthetic_index'] == null
            ? null
            : json['synthetic_index']
                .map<AccountMarketLimitsModel>(
                    (dynamic entry) => AccountMarketLimitsModel.fromJson(entry))
                .toList(),
      );

  ///  commodities limits
  final List<AccountMarketLimitsModel> commoditiesLimits;

  ///  forex limits
  final List<AccountMarketLimitsModel> forexLimits;

  ///  indices limits
  final List<AccountMarketLimitsModel> indicesLimits;

  ///  synthetic_index limits
  final List<AccountMarketLimitsModel> syntheticIndexLimits;
}
