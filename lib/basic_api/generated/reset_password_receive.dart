/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/reset_password_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Reset password receive class.
class ResetPasswordReceive extends Response {
  /// Initialize ResetPasswordReceive.
  const ResetPasswordReceive({
    this.resetPassword,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ResetPasswordReceive.fromJson(Map<String, dynamic> json) =>
      ResetPasswordReceive(
        resetPassword:
            json['reset_password'] == null ? null : json['reset_password'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `true`: password reset success, `false`: password reset failure
  final bool? resetPassword;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'reset_password': resetPassword == null
            ? null
            : resetPassword!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ResetPasswordReceive copyWith({
    bool? resetPassword,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ResetPasswordReceive(
        resetPassword: resetPassword ?? this.resetPassword,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
