/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_change_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Mt5 password change receive class.
class Mt5PasswordChangeReceive extends Response {
  /// Initialize Mt5PasswordChangeReceive.
  const Mt5PasswordChangeReceive({
    this.mt5PasswordChange,
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
  factory Mt5PasswordChangeReceive.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordChangeReceive(
        mt5PasswordChange: json['mt5_password_change'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `1` on success
  final int? mt5PasswordChange;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_password_change': mt5PasswordChange,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordChangeReceive copyWith({
    int? mt5PasswordChange,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Mt5PasswordChangeReceive(
        mt5PasswordChange: mt5PasswordChange ?? this.mt5PasswordChange,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
