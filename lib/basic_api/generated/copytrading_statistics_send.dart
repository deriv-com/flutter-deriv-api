/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_statistics_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Copytrading statistics request class.
class CopytradingStatisticsRequest extends Request {
  /// Initialize CopytradingStatisticsRequest.
  const CopytradingStatisticsRequest({
    this.copytradingStatistics = true,
    required this.traderId,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) : super(
          msgType: 'copytrading_statistics',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory CopytradingStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      CopytradingStatisticsRequest(
        copytradingStatistics: json['copytrading_statistics'] == null
            ? null
            : json['copytrading_statistics'] == 1,
        traderId: json['trader_id'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? copytradingStatistics;

  /// The ID of the target trader.
  final String? traderId;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copytrading_statistics': copytradingStatistics == null
            ? null
            : copytradingStatistics!
                ? 1
                : 0,
        'trader_id': traderId,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopytradingStatisticsRequest copyWith({
    bool? copytradingStatistics,
    String? traderId,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      CopytradingStatisticsRequest(
        copytradingStatistics:
            copytradingStatistics ?? this.copytradingStatistics,
        traderId: traderId ?? this.traderId,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
