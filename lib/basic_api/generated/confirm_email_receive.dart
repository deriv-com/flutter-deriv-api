/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/confirm_email_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Confirm email receive class.
class ConfirmEmailReceive extends Response {
  /// Initialize ConfirmEmailReceive.
  const ConfirmEmailReceive({
    this.confirmEmail,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ConfirmEmailReceive.fromJson(Map<String, dynamic> json) =>
      ConfirmEmailReceive(
        confirmEmail:
            json['confirm_email'] == null ? null : json['confirm_email'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// 1 for success (The verification code has been successfully verified)
  final bool? confirmEmail;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'confirm_email': confirmEmail == null
            ? null
            : confirmEmail!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ConfirmEmailReceive copyWith({
    bool? confirmEmail,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ConfirmEmailReceive(
        confirmEmail: confirmEmail ?? this.confirmEmail,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
