import 'package:flutter_deriv_api/api/account/models/market_trades_breakdown_model.dart';
import 'package:flutter_deriv_api/api/account/models/profitable_trade_model.dart';
import 'package:flutter_deriv_api/api/models/api_base_model.dart';

/// Copy trading statistic model class
abstract class CopyTradingStatisticsModel extends APIBaseModel {
  /// Initializes
  CopyTradingStatisticsModel({
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

  /// This is the epoch the investor started trading.
  final DateTime? activeSince;

  /// Average seconds of keeping positions open.
  final int? avgDuration;

  /// Average loss of trades in percentage.
  final double? avgLoss;

  /// Average profitable trades in percentage.
  final double? avgProfit;

  /// Number of copiers for this trader.
  final int? copiers;

  /// Represents the net change in equity for a 12-month period.
  final double? last12monthsProfitableTrades;

  /// Represents the net change in equity per month.
  final List<ProfitableTradeModel?>? monthlyProfitableTrades;

  /// Trader performance probability.
  final double? performanceProbability;

  /// Total number of trades for all time.
  final int? totalTrades;

  /// Represents the portfolio distribution by markets.
  final List<MarketTradesBreakdownModel?>? tradesBreakdown;

  /// Number of profit trades in percentage.
  final double? tradesProfitable;

  /// Represents the net change in equity per year.
  final List<ProfitableTradeModel?>? yearlyProfitableTrades;
}
