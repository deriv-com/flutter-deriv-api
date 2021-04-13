import 'package:flutter_deriv_api/api/account/models/copy_trading_statistics_model.dart';
import 'package:flutter_deriv_api/api/account/models/market_trades_breakdown_model.dart';
import 'package:flutter_deriv_api/api/account/models/profitable_trade_model.dart';
import 'package:flutter_deriv_api/api/models/base_exception_model.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';

import 'exceptions/copy_trading_exception.dart';

/// Copy trading statistics
class CopyTradingStatistics extends CopyTradingStatisticsModel {
  /// Initializes
  CopyTradingStatistics({
    DateTime? activeSince,
    int? avgDuration,
    double? avgLoss,
    double? avgProfit,
    int? copiers,
    double? last12monthsProfitableTrades,
    List<ProfitableTradeModel?>? monthlyProfitableTrades,
    double? performanceProbability,
    int? totalTrades,
    List<MarketTradesBreakdownModel?>? tradesBreakdown,
    double? tradesProfitable,
    List<ProfitableTradeModel?>? yearlyProfitableTrades,
  }) : super(
          activeSince: activeSince,
          avgDuration: avgDuration,
          avgLoss: avgLoss,
          avgProfit: avgProfit,
          copiers: copiers,
          last12monthsProfitableTrades: last12monthsProfitableTrades,
          monthlyProfitableTrades: monthlyProfitableTrades,
          performanceProbability: performanceProbability,
          totalTrades: totalTrades,
          tradesBreakdown: tradesBreakdown,
          tradesProfitable: tradesProfitable,
          yearlyProfitableTrades: yearlyProfitableTrades,
        );

  /// Creates an instance from JSON
  factory CopyTradingStatistics.fromJson(Map<String, dynamic> json) =>
      CopyTradingStatistics(
        activeSince: getDateTime(json['active_since']),
        avgDuration: json['avg_duration'],
        avgLoss: json['avg_loss']?.toDouble(),
        avgProfit: json['avg_profit']?.toDouble(),
        copiers: json['copiers'],
        last12monthsProfitableTrades:
            json['last_12months_profitable_trades']?.toDouble(),
        monthlyProfitableTrades: getListFromMap(
          json['monthly_profitable_trades']?.entries,
          itemToTypeCallback: (dynamic item) =>
              ProfitableTradeModel.fromJson(item),
        ),
        performanceProbability: json['performance_probability']?.toDouble(),
        totalTrades: json['total_trades'],
        tradesBreakdown: getListFromMap(
          json['trades_breakdown']?.entries,
          itemToTypeCallback: (dynamic item) =>
              MarketTradesBreakdownModel.fromJson(item),
        ),
        tradesProfitable: json['trades_profitable']?.toDouble(),
        yearlyProfitableTrades: getListFromMap(
          json['yearly_profitable_trades']?.entries,
          itemToTypeCallback: (dynamic item) =>
              ProfitableTradeModel.fromJson(item),
        ),
      );

  static final BaseAPI? _api = Injector.getInjector().get<BaseAPI>();

  /// Gets the copy trading statistics for given `traderId` in [request]
  ///
  /// Throws a [CopyTradingException] if API response contains an error
  static Future<CopyTradingStatistics> fetchStatistics(
    CopytradingStatisticsRequest request,
  ) async {
    final CopytradingStatisticsResponse response = await _api!.call<CopytradingStatisticsResponse>(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          CopyTradingException(baseExceptionModel: baseExceptionModel),
    );

    return CopyTradingStatistics.fromJson(response.copytradingStatistics);
  }

  /// Creates a copy of instance with given parameters
  CopyTradingStatistics copyWith({
    DateTime? activeSince,
    int? avgDuration,
    double? avgLoss,
    double? avgProfit,
    int? copiers,
    double? last12monthsProfitableTrades,
    List<ProfitableTradeModel>? monthlyProfitableTrades,
    double? performanceProbability,
    int? totalTrades,
    List<MarketTradesBreakdownModel>? tradesBreakdown,
    double? tradesProfitable,
    List<ProfitableTradeModel>? yearlyProfitableTrades,
  }) =>
      CopyTradingStatistics(
        activeSince: activeSince ?? this.activeSince,
        avgDuration: avgDuration ?? this.avgDuration,
        avgLoss: avgLoss ?? this.avgLoss,
        avgProfit: avgProfit ?? this.avgProfit,
        copiers: copiers ?? this.copiers,
        last12monthsProfitableTrades:
            last12monthsProfitableTrades ?? this.last12monthsProfitableTrades,
        monthlyProfitableTrades:
            monthlyProfitableTrades ?? this.monthlyProfitableTrades,
        performanceProbability:
            performanceProbability ?? this.performanceProbability,
        totalTrades: totalTrades ?? this.totalTrades,
        tradesBreakdown: tradesBreakdown ?? this.tradesBreakdown,
        tradesProfitable: tradesProfitable ?? this.tradesProfitable,
        yearlyProfitableTrades:
            yearlyProfitableTrades ?? this.yearlyProfitableTrades,
      );
}
