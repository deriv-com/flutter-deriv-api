/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/account_statistics_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Account statistics request class.
class AccountStatisticsRequest extends Request {
  /// Initialize AccountStatisticsRequest.
  const AccountStatisticsRequest({
    this.accountStatistics = true,
    super.msgType = 'account_statistics',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AccountStatisticsRequest.fromJson(Map<String, dynamic> json) =>
      AccountStatisticsRequest(
        accountStatistics: json['account_statistics'] == null
            ? null
            : json['account_statistics'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Must be `true`
  final bool? accountStatistics;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_statistics': accountStatistics == null
            ? null
            : accountStatistics!
                ? 1
                : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AccountStatisticsRequest copyWith({
    bool? accountStatistics,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      AccountStatisticsRequest(
        accountStatistics: accountStatistics ?? this.accountStatistics,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
