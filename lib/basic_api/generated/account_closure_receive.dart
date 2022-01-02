/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/account_closure_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Account closure receive class.
class AccountClosureReceive extends Response {
  /// Initialize AccountClosureReceive.
  const AccountClosureReceive({
    this.accountClosure,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory AccountClosureReceive.fromJson(Map<String, dynamic> json) =>
      AccountClosureReceive(
        accountClosure: json['account_closure'] == null
            ? null
            : json['account_closure'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// If set to `true`, all accounts are closed.
  final bool? accountClosure;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_closure': accountClosure == null
            ? null
            : accountClosure!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AccountClosureReceive copyWith({
    bool? accountClosure,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AccountClosureReceive(
        accountClosure: accountClosure ?? this.accountClosure,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
