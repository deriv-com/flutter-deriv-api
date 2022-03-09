/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/change_email_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Change email response class.
class ChangeEmailResponse extends Response {
  /// Initialize ChangeEmailResponse.
  const ChangeEmailResponse({
    this.changeEmail,
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
  factory ChangeEmailResponse.fromJson(Map<String, dynamic> json) =>
      ChangeEmailResponse(
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
  ChangeEmailResponse copyWith({
    bool? changeEmail,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ChangeEmailResponse(
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
