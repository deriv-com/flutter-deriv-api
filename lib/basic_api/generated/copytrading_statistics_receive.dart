/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_statistics_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Copytrading statistics response class
class CopytradingStatisticsResponse extends Response {
  /// Initialize CopytradingStatisticsResponse
  const CopytradingStatisticsResponse({
    this.copytradingStatistics,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CopytradingStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      CopytradingStatisticsResponse(
        copytradingStatistics:
            json['copytrading_statistics'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Statistics of the trader
  final Map<String, dynamic> copytradingStatistics;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copytrading_statistics': copytradingStatistics,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopytradingStatisticsResponse copyWith({
    Map<String, dynamic> copytradingStatistics,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CopytradingStatisticsResponse(
        copytradingStatistics:
            copytradingStatistics ?? this.copytradingStatistics,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
