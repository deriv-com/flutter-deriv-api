import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/common/models/trading_duration_data_model.dart';
import 'package:flutter_deriv_api/api/common/models/trading_duration_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Trading duration class
class TradingDuration extends TradingDurationModel {
  /// Initializes
  TradingDuration({
    MarketModel market,
    SubmarketModel submarket,
    List<TradingDurationDataModel> tradingDurationData,
  }) : super(
          market: market,
          submarket: submarket,
          tradingDurationData: tradingDurationData,
        );

  /// Creates instance from json
  factory TradingDuration.fromJson(Map<String, dynamic> json) =>
      TradingDuration(
        market: getItemFromMap(
          json['market'],
          itemToTypeCallback: (dynamic item) => MarketModel.fromJson(item),
        ),
        submarket: getItemFromMap(
          json['submarket'],
          itemToTypeCallback: (dynamic item) => SubmarketModel.fromJson(item),
        ),
        tradingDurationData: getListFromMap(
          json['data'],
          itemToTypeCallback: (dynamic item) =>
              TradingDurationDataModel.fromJson(item),
        ),
      );

  /// Creates copy of instance with given parameters
  TradingDuration copyWith({
    MarketModel market,
    SubmarketModel submarket,
    List<TradingDurationDataModel> tradingDurationData,
  }) =>
      TradingDuration(
        market: market ?? this.market,
        submarket: submarket ?? this.submarket,
        tradingDurationData: tradingDurationData ?? this.tradingDurationData,
      );
}
