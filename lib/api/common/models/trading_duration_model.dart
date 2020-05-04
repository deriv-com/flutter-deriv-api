import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/common/models/trading_duration_data_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Trading duration model class
abstract class TradingDurationModel extends APIBaseModel {
  /// Initializes
  TradingDurationModel({
    this.market,
    this.submarket,
    this.tradingDurationData,
  });

  /// The market in which the underlyings listed in `symbol` located.
  final MarketModel market;

  /// The submarket in which the underlyings listed in `symbol` located.
  final SubmarketModel submarket;

  /// List of trade durations available for symbols and contract combinations.
  final List<TradingDurationDataModel> tradingDurationData;
}
