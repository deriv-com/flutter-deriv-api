/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/mt5_password_reset_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Mt5 password reset response class
class Mt5PasswordResetResponse extends Response {
  /// Initialize Mt5PasswordResetResponse
  const Mt5PasswordResetResponse({
    this.mt5PasswordReset,
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

  /// Creates an instance from JSON
  factory Mt5PasswordResetResponse.fromJson(Map<String, dynamic> json) =>
      Mt5PasswordResetResponse(
        mt5PasswordReset: json['mt5_password_reset'] as int?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `1` on success
  final int? mt5PasswordReset;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'mt5_password_reset': mt5PasswordReset,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  Mt5PasswordResetResponse copyWith({
    int? mt5PasswordReset,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      Mt5PasswordResetResponse(
        mt5PasswordReset: mt5PasswordReset ?? this.mt5PasswordReset,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
