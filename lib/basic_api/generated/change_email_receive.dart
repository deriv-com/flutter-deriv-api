/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/change_email_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Change email receive class.
class ChangeEmailReceive extends Response {
  /// Initialize ChangeEmailReceive.
  const ChangeEmailReceive({
    this.changeEmail,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ChangeEmailReceive.fromJson(Map<String, dynamic> json) =>
      ChangeEmailReceive(
        changeEmail:
            json['change_email'] == null ? null : json['change_email'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// `true`: email changed sucssesfully, `false`: failed to change email
  final bool? changeEmail;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'change_email': changeEmail == null
            ? null
            : changeEmail!
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ChangeEmailReceive copyWith({
    bool? changeEmail,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ChangeEmailReceive(
        changeEmail: changeEmail ?? this.changeEmail,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
