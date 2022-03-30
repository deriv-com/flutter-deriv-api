/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/account_security_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Account security response class.
class AccountSecurityResponse extends Response {
  /// Initialize AccountSecurityResponse.
  const AccountSecurityResponse({
    this.accountSecurity,
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
  factory AccountSecurityResponse.fromJson(Map<String, dynamic> json) =>
      AccountSecurityResponse(
        accountSecurity: json['account_security'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// The information of 2-Factor authentication.
  final Map<String, dynamic>? accountSecurity;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'account_security': accountSecurity,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  AccountSecurityResponse copyWith({
    Map<String, dynamic>? accountSecurity,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      AccountSecurityResponse(
        accountSecurity: accountSecurity ?? this.accountSecurity,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
