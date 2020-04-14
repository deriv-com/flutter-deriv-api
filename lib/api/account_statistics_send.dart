/// generated automatically from flutter_deriv_api|lib/api/account_statistics_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'account_statistics_send.g.dart';

/// JSON conversion for 'account_statistics_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class AccountStatisticsRequest extends Request {
  /// Initialize AccountStatisticsRequest
  const AccountStatisticsRequest({
    this.accountStatistics = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory AccountStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountStatisticsRequestFromJson(json);

  // Properties
  /// Must be `1`
  final int accountStatistics;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$AccountStatisticsRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  AccountStatisticsRequest copyWith({
    int accountStatistics,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      AccountStatisticsRequest(
        accountStatistics: accountStatistics ?? this.accountStatistics,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
