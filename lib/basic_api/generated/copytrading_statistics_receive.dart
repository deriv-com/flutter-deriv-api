/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_statistics_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Copytrading statistics receive class.
class CopytradingStatisticsReceive extends Response {
  /// Initialize CopytradingStatisticsReceive.
  const CopytradingStatisticsReceive({
    this.copytradingStatistics,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory CopytradingStatisticsReceive.fromJson(Map<String, dynamic> json) =>
      CopytradingStatisticsReceive(
        copytradingStatistics:
            json['copytrading_statistics'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Statistics of the trader
  final Map<String, dynamic>? copytradingStatistics;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copytrading_statistics': copytradingStatistics,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopytradingStatisticsReceive copyWith({
    Map<String, dynamic>? copytradingStatistics,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      CopytradingStatisticsReceive(
        copytradingStatistics:
            copytradingStatistics ?? this.copytradingStatistics,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
