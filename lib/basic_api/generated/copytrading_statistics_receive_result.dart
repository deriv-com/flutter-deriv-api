/// Copytrading statistics receive model class
abstract class CopytradingStatisticsReceiveModel {
  /// Initializes
  CopytradingStatisticsReceiveModel({
    @required this.copytradingStatistics,
  });

  /// Statistics of the trader
  final CopytradingStatistics copytradingStatistics;
}

/// Copytrading statistics receive class
class CopytradingStatisticsReceive extends CopytradingStatisticsReceiveModel {
  /// Initializes
  CopytradingStatisticsReceive({
    @required CopytradingStatistics copytradingStatistics,
  }) : super(
          copytradingStatistics: copytradingStatistics,
        );

  /// Creates an instance from JSON
  factory CopytradingStatisticsReceive.fromJson(Map<String, dynamic> json) =>
      CopytradingStatisticsReceive(
        copytradingStatistics: json['copytrading_statistics'] == null
            ? null
            : CopytradingStatistics.fromJson(json['copytrading_statistics']),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    if (copytradingStatistics != null) {
      result['copytrading_statistics'] = copytradingStatistics.toJson();
    }

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopytradingStatisticsReceive copyWith({
    CopytradingStatistics copytradingStatistics,
  }) =>
      CopytradingStatisticsReceive(
        copytradingStatistics:
            copytradingStatistics ?? this.copytradingStatistics,
      );
}
/// Copytrading statistics model class
abstract class CopytradingStatisticsModel {
  /// Initializes
  CopytradingStatisticsModel({
    @required this.activeSince,
    @required this.avgDuration,
    @required this.avgLoss,
    @required this.avgProfit,
    @required this.copiers,
    @required this.last12monthsProfitableTrades,
    @required this.monthlyProfitableTrades,
    @required this.performanceProbability,
    @required this.totalTrades,
    @required this.tradesBreakdown,
    @required this.tradesProfitable,
    @required this.yearlyProfitableTrades,
  });

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
  final Map<String, dynamic> monthlyProfitableTrades;

  /// Trader performance probability.
  final double performanceProbability;

  /// Total number of trades for all time.
  final int totalTrades;

  /// Represents the portfolio distribution by markets.
  final Map<String, dynamic> tradesBreakdown;

  /// Number of profit trades in percentage.
  final double tradesProfitable;

  /// Represents the net change in equity per year.
  final Map<String, dynamic> yearlyProfitableTrades;
}

/// Copytrading statistics class
class CopytradingStatistics extends CopytradingStatisticsModel {
  /// Initializes
  CopytradingStatistics({
    @required int activeSince,
    @required int avgDuration,
    @required double avgLoss,
    @required double avgProfit,
    @required double copiers,
    @required double last12monthsProfitableTrades,
    @required Map<String, dynamic> monthlyProfitableTrades,
    @required double performanceProbability,
    @required int totalTrades,
    @required Map<String, dynamic> tradesBreakdown,
    @required double tradesProfitable,
    @required Map<String, dynamic> yearlyProfitableTrades,
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
  factory CopytradingStatistics.fromJson(Map<String, dynamic> json) =>
      CopytradingStatistics(
        activeSince: json['active_since'],
        avgDuration: json['avg_duration'],
        avgLoss: getDouble(json['avg_loss']),
        avgProfit: getDouble(json['avg_profit']),
        copiers: getDouble(json['copiers']),
        last12monthsProfitableTrades:
            getDouble(json['last_12months_profitable_trades']),
        monthlyProfitableTrades: json['monthly_profitable_trades'],
        performanceProbability: getDouble(json['performance_probability']),
        totalTrades: json['total_trades'],
        tradesBreakdown: json['trades_breakdown'],
        tradesProfitable: getDouble(json['trades_profitable']),
        yearlyProfitableTrades: json['yearly_profitable_trades'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['active_since'] = activeSince;
    result['avg_duration'] = avgDuration;
    result['avg_loss'] = avgLoss;
    result['avg_profit'] = avgProfit;
    result['copiers'] = copiers;
    result['last_12months_profitable_trades'] = last12monthsProfitableTrades;
    result['monthly_profitable_trades'] = monthlyProfitableTrades;
    result['performance_probability'] = performanceProbability;
    result['total_trades'] = totalTrades;
    result['trades_breakdown'] = tradesBreakdown;
    result['trades_profitable'] = tradesProfitable;
    result['yearly_profitable_trades'] = yearlyProfitableTrades;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopytradingStatistics copyWith({
    int activeSince,
    int avgDuration,
    double avgLoss,
    double avgProfit,
    double copiers,
    double last12monthsProfitableTrades,
    Map<String, dynamic> monthlyProfitableTrades,
    double performanceProbability,
    int totalTrades,
    Map<String, dynamic> tradesBreakdown,
    double tradesProfitable,
    Map<String, dynamic> yearlyProfitableTrades,
  }) =>
      CopytradingStatistics(
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
