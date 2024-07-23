/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_new_account_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Mt5 new account receive class.
class Mt5NewAccountReceive extends Response {
  /// Initialize Mt5NewAccountReceive.
  const Mt5NewAccountReceive({
    this.mt5NewAccount,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory Mt5NewAccountReceive.fromJson(Map<String, dynamic> json) =>
      Mt5NewAccountReceive(
        mt5NewAccount: json['mt5_new_account'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// New MT5 account details
  final Map<String, dynamic>? mt5NewAccount;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_new_account': mt5NewAccount,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5NewAccountReceive copyWith({
    Map<String, dynamic>? mt5NewAccount,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Mt5NewAccountReceive(
        mt5NewAccount: mt5NewAccount ?? this.mt5NewAccount,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
