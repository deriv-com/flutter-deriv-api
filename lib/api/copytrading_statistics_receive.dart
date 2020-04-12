/// generated automatically from flutter_deriv_api|lib/api/copytrading_statistics_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'copytrading_statistics_receive.g.dart';

/// JSON conversion for 'copytrading_statistics_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopytradingStatisticsResponse extends Response {
  /// Initialize CopytradingStatisticsResponse
  CopytradingStatisticsResponse({
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

  /// Creates instance from JSON
  factory CopytradingStatisticsResponse.fromJson(Map<String, dynamic> json) =>
      _$CopytradingStatisticsResponseFromJson(json);

  // Properties
  /// Statistics of the trader
  final Map<String, dynamic> copytradingStatistics;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopytradingStatisticsResponseToJson(this);
}
