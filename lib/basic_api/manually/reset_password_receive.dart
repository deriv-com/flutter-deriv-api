// ignore_for_file: avoid_as

import '../response.dart';

/// Password reset response class.
class ResetPasswordResponse extends Response {
  /// Initialize PasswordResetResponse.
  const ResetPasswordResponse({
    this.resetPassword,
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
  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse(
        resetPassword:
            json['reset_password'] == null ? null : json['reset_password'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// If set to `true`, the password has been reset.
  final bool? resetPassword;

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
