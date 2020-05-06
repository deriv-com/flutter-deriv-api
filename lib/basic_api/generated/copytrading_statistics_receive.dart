/// generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_statistics_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'copytrading_statistics_receive.g.dart';

/// JSON conversion for 'copytrading_statistics_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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
      _$CopytradingStatisticsResponseFromJson(json);

  // Properties
  /// Statistics of the trader
  final Map<String, dynamic> copytradingStatistics;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$CopytradingStatisticsResponseToJson(this);

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
