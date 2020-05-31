/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copytrading_statistics_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'copytrading_statistics_send.g.dart';

/// JSON conversion for 'copytrading_statistics_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class CopytradingStatisticsRequest extends Request {
  /// Initialize CopytradingStatisticsRequest
  const CopytradingStatisticsRequest({
    this.copytradingStatistics = 1,
    this.traderId,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'copytrading_statistics',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory CopytradingStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      _$CopytradingStatisticsRequestFromJson(json);

  /// Must be `1`
  final int copytradingStatistics;

  /// The ID of the target trader.
  final String traderId;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$CopytradingStatisticsRequestToJson(this);

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
