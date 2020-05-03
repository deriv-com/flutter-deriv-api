import 'package:flutter_deriv_api/api/models/account_market_limits_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

import 'api_base_model.dart';

/// Contains limitation information for each market.
class AccountMarketSpecificModel extends APIBaseModel {
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
        commoditiesLimits: getListFromMap(
          json['commodities'],
          itemToTypeCallback: (dynamic item) =>
              AccountMarketLimitsModel.fromJson(item),
        ),
        forexLimits: getListFromMap(
          json['forex'],
          itemToTypeCallback: (dynamic item) =>
              AccountMarketLimitsModel.fromJson(item),
        ),
        indicesLimits: getListFromMap(
          json['indices'],
          itemToTypeCallback: (dynamic item) =>
              AccountMarketLimitsModel.fromJson(item),
        ),
        syntheticIndexLimits: getListFromMap(
          json['synthetic_index'],
          itemToTypeCallback: (dynamic item) =>
              AccountMarketLimitsModel.fromJson(item),
        ),
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
