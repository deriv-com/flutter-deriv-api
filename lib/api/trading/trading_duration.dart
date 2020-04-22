import 'package:flutter_deriv_api/api/models/market_model.dart';
import 'package:flutter_deriv_api/api/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/models/trading_duration_data_model.dart';
import 'package:flutter_deriv_api/api/models/trading_duration_model.dart';

/// Trading duration class
class TradingDuration extends TradingDurationModel {
  /// Class constructor
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
        market: json['market'] == null
            ? null
            : MarketModel.fromJson(json['market']),
        submarket: json['submarket'] == null
            ? null
            : SubmarketModel.fromJson(json['submarket']),
        tradingDurationData: json['data'] == null
            ? null
            : json['data']
                .map<TradingDurationDataModel>(
                    (dynamic item) => TradingDurationDataModel.fromJson(item))
                .toList(),
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
