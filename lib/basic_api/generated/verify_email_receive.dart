/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/verify_email_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Verify email receive class.
class VerifyEmailReceive extends Response {
  /// Initialize VerifyEmailReceive.
  const VerifyEmailReceive({
    this.verifyEmail,
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
  factory VerifyEmailReceive.fromJson(Map<String, dynamic> json) =>
      VerifyEmailReceive(
        verifyEmail:
            json['verify_email'] == null ? null : json['verify_email'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// 1 for success (secure code has been sent to the email address)
  final bool? verifyEmail;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'verify_email': verifyEmail == null
            ? null
            : verifyEmail!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  VerifyEmailReceive copyWith({
    bool? verifyEmail,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      VerifyEmailReceive(
        verifyEmail: verifyEmail ?? this.verifyEmail,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
