import 'package:flutter_deriv_api/api/common/models/market_model.dart';
import 'package:flutter_deriv_api/api/common/models/submarket_model.dart';
import 'package:flutter_deriv_api/api/common/models/trading_duration_data_model.dart';
import 'package:flutter_deriv_api/api/common/models/trading_duration_model.dart';
import 'package:flutter_deriv_api/api/common/trading/exceptions/trading_exception.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
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

  /// Creates an instance from JSON
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

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

  /// Creates a copy of instance with given parameters
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

  /// Retrieve a list of all available underlyings and the corresponding contract types and trading duration boundaries.
  /// If the user is logged in, only the assets available for that user's landing company will be returned.
  /// For parameters information refer to [TradingDurationsRequest].
  static Future<List<TradingDuration>> fetchTradingDurations(
    TradingDurationsRequest request,
  ) async {
    final TradingDurationsResponse response = await _api.call(request: request);

    checkException(
      response: response,
      exceptionCreator: (String message) => TradingException(
        message: message,
      ),
    );

    return getListFromMap(
      response.tradingDurations,
      itemToTypeCallback: (dynamic item) => TradingDuration.fromJson(item),
    );
  }
}
