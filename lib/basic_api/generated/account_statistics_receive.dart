/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/account_statistics_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Account statistics receive class.
class AccountStatisticsReceive extends Response {
  /// Initialize AccountStatisticsReceive.
  const AccountStatisticsReceive({
    this.accountStatistics,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory AccountStatisticsReceive.fromJson(Map<String, dynamic> json) =>
      AccountStatisticsReceive(
        accountStatistics: json['account_statistics'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Response of account statistics
  final Map<String, dynamic>? accountStatistics;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_statistics': accountStatistics,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AccountStatisticsReceive copyWith({
    Map<String, dynamic>? accountStatistics,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AccountStatisticsReceive(
        accountStatistics: accountStatistics ?? this.accountStatistics,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
