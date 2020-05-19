import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/trading_times_model.dart';
import 'package:flutter_deriv_api/api/common/trading/exceptions/trading_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/utils/helpers.dart';

/// Trading time class
class TradingTimes extends TradingTimesModel {
  /// Initializes
  TradingTimes({
    List<MarketModel> markets,
  }) : super(
          markets: markets,
        );

  /// Creates an instance from JSON
  factory TradingTimes.fromJson(Map<String, dynamic> json) => TradingTimes(
        markets: getListFromMap(
          json['markets'],
          itemToTypeCallback: (dynamic item) => MarketModel.fromJson(item),
        ),
      );

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
  TradingTimes copyWith({
    List<MarketModel> markets,
  }) =>
      TradingTimes(
        markets: markets ?? this.markets,
      );

  /// Receives a list of market opening times for a given date.
  ///
  /// For parameters information refer to [TradingTimesRequest].
  /// Throws a [TradingException] if API response contains an error
  static Future<TradingTimes> fetchTradingTimes(
    TradingTimesRequest request,
  ) async {
    final TradingTimesResponse response = await _api.call(request: request);

    if (response.error != null) {
      throw TradingException(message: response.error['message']);
    }

    return TradingTimes.fromJson(response.tradingTimes);
  }
}
