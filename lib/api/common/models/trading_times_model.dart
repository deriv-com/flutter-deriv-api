import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Trading time model class
abstract class TradingTimesModel extends APIBaseModel {
  /// Initializes
  TradingTimesModel({
    this.markets,
  });

  /// Markets in which the underlyings listed in `symbol` located.
  final List<MarketModel?>? markets;
}
