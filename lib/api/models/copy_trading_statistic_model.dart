import 'base_model.dart';

/// Copy trading statistic model class
class CopyTradingStatisticModel extends BaseModel {
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
        activeSince: json['active_since'],
        avgDuration: json['avg_duration'],
        avgLoss: json['avg_loss'],
        avgProfit: json['avg_profit'],
        copiers: json['copiers'],
        last12monthsProfitableTrades: json['last_12months_profitable_trades'],
        monthlyProfitableTrades: json['monthly_profitable_trades'],
        performanceProbability: json['performance_probability'],
        totalTrades: json['total_trades'],
        tradesBreakdown: json['trades_breakdown'],
        tradesProfitable: json['trades_profitable'],
        yearlyProfitableTrades: json['yearly_profitable_trades'],
      );

  /// This is the epoch the investor started trading.
  final int activeSince;

  /// Average seconds of keeping positions open.
  final int avgDuration;

  /// Average loss of trades in percentage.
  final double avgLoss;

  /// Average profitable trades in percentage.
  final double avgProfit;

  /// Number of copiers for this trader.
  final double copiers;

  /// Represents the net change in equity for a 12-month period.
  final double last12monthsProfitableTrades;

  /// Represents the net change in equity per month.
  final num monthlyProfitableTrades;

  /// Trader performance probability.
  final double performanceProbability;

  /// Total number of trades for all time.
  final int totalTrades;

  /// Represents the portfolio distribution by markets.
  final num tradesBreakdown;

  /// Number of profit trades in percentage.
  final double tradesProfitable;

  /// Represents the net change in equity per year.
  final num yearlyProfitableTrades;

  /// Creates copy of instance with given parameters
  CopyTradingStatisticModel copyWith({
    int activeSince,
    int avgDuration,
    double avgLoss,
    double avgProfit,
    double copiers,
    double last12monthsProfitableTrades,
    num monthlyProfitableTrades,
    double performanceProbability,
    int totalTrades,
    num tradesBreakdown,
    double tradesProfitable,
    num yearlyProfitableTrades,
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
