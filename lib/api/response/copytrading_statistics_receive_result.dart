import '../../basic_api/generated/copytrading_statistics_receive.dart';
import '../../basic_api/generated/copytrading_statistics_send.dart';
import '../../helpers/helpers.dart';
import '../../services/connection/api_manager/base_api.dart';
import '../../services/dependency_injector/injector.dart';
import '../exceptions/exceptions.dart';
import '../models/base_exception_model.dart';

/// Copytrading statistics response model class.
abstract class CopytradingStatisticsResponseModel {
  /// Initializes.
  CopytradingStatisticsResponseModel({
    this.copytradingStatistics,
  });

  /// Statistics of the trader
  final CopytradingStatistics? copytradingStatistics;
}

/// Copytrading statistics response class.
class CopytradingStatisticsResponse extends CopytradingStatisticsResponseModel {
  /// Initializes
  CopytradingStatisticsResponse({
    CopytradingStatistics? copytradingStatistics,
  }) : super(
          copytradingStatistics: copytradingStatistics,
        );

  /// Creates an instance from JSON
  factory CopytradingStatisticsResponse.fromJson(
    dynamic copytradingStatisticsJson,
  ) =>
      CopytradingStatisticsResponse(
        copytradingStatistics: copytradingStatisticsJson == null
            ? null
            : CopytradingStatistics.fromJson(copytradingStatisticsJson),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    if (copytradingStatistics != null) {
      resultMap['copytrading_statistics'] = copytradingStatistics!.toJson();
    }

    return resultMap;
  }

  static final BaseAPI _api = Injector.getInjector().get<BaseAPI>()!;

  /// Gets the copy trading statistics for given `traderId` in [request]
  ///
  /// Throws a [CopyTradingException] if API response contains an error
  static Future<CopytradingStatisticsResponse> fetchStatistics(
    CopytradingStatisticsSend request,
  ) async {
    final CopytradingStatisticsReceive response = await _api.call(
      request: request,
    );

    checkException(
      response: response,
      exceptionCreator: ({BaseExceptionModel? baseExceptionModel}) =>
          CopyTradingException(baseExceptionModel: baseExceptionModel),
    );

    return CopytradingStatisticsResponse.fromJson(
        response.copytradingStatistics);
  }

  /// Creates a copy of instance with given parameters.
  CopytradingStatisticsResponse copyWith({
    CopytradingStatistics? copytradingStatistics,
  }) =>
      CopytradingStatisticsResponse(
        copytradingStatistics:
            copytradingStatistics ?? this.copytradingStatistics,
      );
}
/// Copytrading statistics model class.
abstract class CopytradingStatisticsModel {
  /// Initializes.
  CopytradingStatisticsModel({
    required this.tradesProfitable,
    required this.tradesBreakdown,
    required this.totalTrades,
    required this.performanceProbability,
    required this.monthlyProfitableTrades,
    required this.last12monthsProfitableTrades,
    required this.copiers,
    required this.avgProfit,
    required this.avgLoss,
    required this.avgDuration,
    required this.activeSince,
    this.yearlyProfitableTrades,
  });

  /// Number of profit trades in percentage.
  final double tradesProfitable;

  /// Represents the portfolio distribution by markets.
  final Map<String, double> tradesBreakdown;

  /// Total number of trades for all time.
  final int totalTrades;

  /// Trader performance probability.
  final double performanceProbability;

  /// Represents the net change in equity per month.
  final Map<String, double> monthlyProfitableTrades;

  /// Represents the net change in equity for a 12-month period.
  final double last12monthsProfitableTrades;

  /// Number of copiers for this trader.
  final double copiers;

  /// Average profitable trades in percentage.
  final double avgProfit;

  /// Average loss of trades in percentage.
  final double avgLoss;

  /// Average seconds of keeping positions open.
  final int avgDuration;

  /// This is the epoch the investor started trading.
  final DateTime activeSince;

  /// Represents the net change in equity per year.
  final Map<String, double>? yearlyProfitableTrades;
}

/// Copytrading statistics class.
class CopytradingStatistics extends CopytradingStatisticsModel {
  /// Initializes
  CopytradingStatistics({
    required DateTime activeSince,
    required int avgDuration,
    required double avgLoss,
    required double avgProfit,
    required double copiers,
    required double last12monthsProfitableTrades,
    required Map<String, double> monthlyProfitableTrades,
    required double performanceProbability,
    required int totalTrades,
    required Map<String, double> tradesBreakdown,
    required double tradesProfitable,
    Map<String, double>? yearlyProfitableTrades,
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
        activeSince: getDateTime(json['active_since'])!,
        avgDuration: json['avg_duration'],
        avgLoss: getDouble(json['avg_loss'])!,
        avgProfit: getDouble(json['avg_profit'])!,
        copiers: getDouble(json['copiers'])!,
        last12monthsProfitableTrades:
            getDouble(json['last_12months_profitable_trades'])!,
        monthlyProfitableTrades: Map<String, double>.fromEntries(json[
                'monthly_profitable_trades']
            .entries
            .map<MapEntry<String, double>>((MapEntry<String, dynamic> entry) =>
                MapEntry<String, double>(entry.key, getDouble(entry.value)!))),
        performanceProbability: getDouble(json['performance_probability'])!,
        totalTrades: json['total_trades'],
        tradesBreakdown: Map<String, double>.fromEntries(
            json['trades_breakdown'].entries.map<MapEntry<String, double>>(
                (MapEntry<String, dynamic> entry) => MapEntry<String, double>(
                    entry.key, getDouble(entry.value)!))),
        tradesProfitable: getDouble(json['trades_profitable'])!,
        yearlyProfitableTrades: json['yearly_profitable_trades'] == null
            ? null
            : Map<String, double>.fromEntries(json['yearly_profitable_trades']
                .entries
                .map<MapEntry<String, double>>(
                    (MapEntry<String, dynamic> entry) =>
                        MapEntry<String, double>(
                            entry.key, getDouble(entry.value)!))),
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> resultMap = <String, dynamic>{};

    resultMap['active_since'] = getSecondsSinceEpochDateTime(activeSince);
    resultMap['avg_duration'] = avgDuration;
    resultMap['avg_loss'] = avgLoss;
    resultMap['avg_profit'] = avgProfit;
    resultMap['copiers'] = copiers;
    resultMap['last_12months_profitable_trades'] = last12monthsProfitableTrades;
    resultMap['monthly_profitable_trades'] = monthlyProfitableTrades;
    resultMap['performance_probability'] = performanceProbability;
    resultMap['total_trades'] = totalTrades;
    resultMap['trades_breakdown'] = tradesBreakdown;
    resultMap['trades_profitable'] = tradesProfitable;
    resultMap['yearly_profitable_trades'] = yearlyProfitableTrades;

    return resultMap;
  }

  /// Creates a copy of instance with given parameters.
  CopytradingStatistics copyWith({
    required DateTime activeSince,
    required int avgDuration,
    required double avgLoss,
    required double avgProfit,
    required double copiers,
    required double last12monthsProfitableTrades,
    required Map<String, double> monthlyProfitableTrades,
    required double performanceProbability,
    required int totalTrades,
    required Map<String, double> tradesBreakdown,
    required double tradesProfitable,
    Map<String, double>? yearlyProfitableTrades,
  }) =>
      CopytradingStatistics(
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
        yearlyProfitableTrades:
            yearlyProfitableTrades ?? this.yearlyProfitableTrades,
      );
}
