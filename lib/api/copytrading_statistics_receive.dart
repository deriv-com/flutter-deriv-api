/// generated automatically from flutter_deriv_api|lib/api/copytrading_statistics_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'copytrading_statistics_receive.g.dart';

/// JSON conversion for 'copytrading_statistics_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopytradingStatisticsResponse extends Response {
  /// Initialize CopytradingStatisticsResponse
  const CopytradingStatisticsResponse({
    this.copytradingStatistics,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory CopytradingStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$CopytradingStatisticsResponseFromJson(json);

  // Properties
  /// Statistics of the trader
  final Map<String, dynamic> copytradingStatistics;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopytradingStatisticsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  CopytradingStatisticsResponse copyWith({
    Map<String, dynamic> copytradingStatistics,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      CopytradingStatisticsResponse(
        copytradingStatistics:
            copytradingStatistics ?? this.copytradingStatistics,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
