import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/trading_times_model.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Trading time class
class TradingTimes extends TradingTimesModel {
  /// Initializes
  TradingTimes({
    List<MarketModel> markets,
  }) : super(
          markets: markets,
        );

  /// Creates instance from json
  factory TradingTimes.fromJson(Map<String, dynamic> json) => TradingTimes(
        markets: getListFromMap(
          json['markets'],
          itemToTypeCallback: (dynamic item) => MarketModel.fromJson(item),
        ),
      );

  /// Creates copy of instance with given parameters
  TradingTimes copyWith({
    List<MarketModel> markets,
  }) =>
      TradingTimes(
        markets: markets ?? this.markets,
      );
}
