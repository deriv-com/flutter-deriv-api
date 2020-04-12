/// generated automatically from flutter_deriv_api|lib/api/copytrading_statistics_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'copytrading_statistics_send.g.dart';

/// JSON conversion for 'copytrading_statistics_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class CopytradingStatisticsRequest extends Request {
  /// Initialize CopytradingStatisticsRequest
  CopytradingStatisticsRequest({
    this.copytradingStatistics = 1,
    this.traderId,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory CopytradingStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      _$CopytradingStatisticsRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int copytradingStatistics;

  /// The ID of the target trader.
  final String traderId;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$CopytradingStatisticsRequestToJson(this);
}
