import 'package:flutter_deriv_api/api/models/market_model.dart';
import 'package:flutter_deriv_api/api/models/trading_times_model.dart';

/// Trading time class
class TradingTimes extends TradingTimesModel {
  /// Class constructor
  TradingTimes({
    List<MarketModel> markets,
  }) : super(
          markets: markets,
        );

  /// Creates instance from json
  factory TradingTimes.fromJson(Map<String, dynamic> json) => TradingTimes(
        markets: json['markets'] == null
            ? null
            : json['markets']
                .map<MarketModel>((dynamic item) => MarketModel.fromJson(item))
                .toList(),
      );

  /// Creates copy of instance with given parameters
  TradingTimes copyWith({
    List<MarketModel> markets,
  }) =>
      TradingTimes(
        markets: markets ?? this.markets,
      );
}
