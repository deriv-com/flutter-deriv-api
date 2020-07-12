/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_statistics_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// CopytradingStatisticsRequest class
class CopytradingStatisticsRequest extends Request {
  /// Initialize CopytradingStatisticsRequest
  const CopytradingStatisticsRequest({
    this.copytradingStatistics = 1,
    @required this.traderId,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'copytrading_statistics',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CopytradingStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      CopytradingStatisticsRequest(
        // ignore: avoid_as
        copytradingStatistics: json['copytrading_statistics'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as
        traderId: json['trader_id'] as String,
      );

  /// Must be `1`
  final int copytradingStatistics;

  /// The ID of the target trader.
  final String traderId;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copytrading_statistics': copytradingStatistics,
        'passthrough': passthrough,
        'req_id': reqId,
        'trader_id': traderId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopytradingStatisticsRequest copyWith({
    int copytradingStatistics,
    String traderId,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      CopytradingStatisticsRequest(
        copytradingStatistics:
            copytradingStatistics ?? this.copytradingStatistics,
        traderId: traderId ?? this.traderId,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
