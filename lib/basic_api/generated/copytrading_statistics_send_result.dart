/// Copytrading statistics send model class
abstract class CopytradingStatisticsSendModel {
  /// Initializes
  CopytradingStatisticsSendModel({
    @required this.copytradingStatistics,
    @required this.traderId,
  });

  /// Must be `1`
  final int copytradingStatistics;

  /// The ID of the target trader.
  final String traderId;
}

/// Copytrading statistics send class
class CopytradingStatisticsSend extends CopytradingStatisticsSendModel {
  /// Initializes
  CopytradingStatisticsSend({
    @required int copytradingStatistics,
    @required String traderId,
  }) : super(
          copytradingStatistics: copytradingStatistics,
          traderId: traderId,
        );

  /// Creates an instance from JSON
  factory CopytradingStatisticsSend.fromJson(Map<String, dynamic> json) =>
      CopytradingStatisticsSend(
        copytradingStatistics: json['copytrading_statistics'],
        traderId: json['trader_id'],
      );

  /// Converts an instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> result = <String, dynamic>{};

    result['copytrading_statistics'] = copytradingStatistics;
    result['trader_id'] = traderId;

    return result;
  }

  /// Creates a copy of instance with given parameters
  CopytradingStatisticsSend copyWith({
    int copytradingStatistics,
    String traderId,
  }) =>
      CopytradingStatisticsSend(
        copytradingStatistics:
            copytradingStatistics ?? this.copytradingStatistics,
        traderId: traderId ?? this.traderId,
      );
}
