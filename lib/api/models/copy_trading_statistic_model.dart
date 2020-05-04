import 'package:flutter_deriv_api/utils/helpers.dart';

import 'api_base_model.dart';
import 'market_trades_breakdown_model.dart';
import 'profitable_trade_model.dart';

/// Copy trading statistic model class
class CopyTradingStatisticModel extends APIBaseModel {
  /// Initializes
  CopyTradingStatisticModel({
    this.activeSince,
    this.avgDuration,
    this.avgLoss,
    this.avgProfit,
    this.copiers,
    this.last12monthsProfitableTrades,
    this.monthlyProfitableTrades,
    this.performanceProbability,
    this.totalTrades,
    this.tradesBreakdown,
    this.tradesProfitable,
    this.yearlyProfitableTrades,
  });

  /// Creates instance from JSON
  factory CopyTradingStatisticModel.fromJson(Map<String, dynamic> json) =>
      CopyTradingStatisticModel(
        activeSince: getDateTime(json['active_since']),
        avgDuration: json['avg_duration'],
        avgLoss: json['avg_loss']?.toDouble(),
        avgProfit: json['avg_profit']?.toDouble(),
        copiers: json['copiers'],
        last12monthsProfitableTrades:
            json['last_12months_profitable_trades']?.toDouble(),
        monthlyProfitableTrades: getListFromMap(
          json['monthly_profitable_trades'].entries,
          itemToTypeCallback: (dynamic item) =>
              ProfitableTradeModel.fromJson(item),
        ),
        performanceProbability: json['performance_probability']?.toDouble(),
        totalTrades: json['total_trades'],
        tradesBreakdown: getListFromMap(
          json['trades_breakdown'].entries,
          itemToTypeCallback: (dynamic item) =>
              MarketTradesBreakdownModel.fromJson(item),
        ),
        tradesProfitable: json['trades_profitable']?.toDouble(),
        yearlyProfitableTrades: getListFromMap(
          json['yearly_profitable_trades'].entries,
          itemToTypeCallback: (dynamic item) =>
              ProfitableTradeModel.fromJson(item),
        ),
      );

  /// This is the epoch the investor started trading.
  final DateTime activeSince;

  /// Average seconds of keeping positions open.
  final int avgDuration;

  /// Average loss of trades in percentage.
  final double avgLoss;

  /// Average profitable trades in percentage.
  final double avgProfit;

  /// Number of copiers for this trader.
  final int copiers;

  /// Represents the net change in equity for a 12-month period.
  final double last12monthsProfitableTrades;

  /// Represents the net change in equity per month.
  final List<ProfitableTradeModel> monthlyProfitableTrades;

  /// Trader performance probability.
  final double performanceProbability;

  /// Total number of trades for all time.
  final int totalTrades;

  /// Represents the portfolio distribution by markets.
  final List<MarketTradesBreakdownModel> tradesBreakdown;

  /// Number of profit trades in percentage.
  final double tradesProfitable;

  /// Represents the net change in equity per year.
  final List<ProfitableTradeModel> yearlyProfitableTrades;

  /// Creates copy of instance with given parameters
  CopyTradingStatisticModel copyWith({
    DateTime activeSince,
    int avgDuration,
    double avgLoss,
    double avgProfit,
    double copiers,
    double last12monthsProfitableTrades,
    List<ProfitableTradeModel> monthlyProfitableTrades,
    double performanceProbability,
    int totalTrades,
    List<MarketTradesBreakdownModel> tradesBreakdown,
    double tradesProfitable,
    List<ProfitableTradeModel> yearlyProfitableTrades,
  }) =>
      CopyTradingStatisticModel(
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
