import 'package:flutter_deriv_api/api/models/base_model.dart';
import 'package:flutter_deriv_api/api/models/market_model.dart';

/// Trading time model class
abstract class TradingTimesModel extends BaseModel {
  /// Class constructor
  TradingTimesModel({
    this.markets,
  });

  /// Markets in which the underlyings listed in `symbol` located.
  final List<MarketModel> markets;
}
