/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/verify_email_receive.json

import '../response.dart';

/// VerifyEmailResponse class
class VerifyEmailResponse extends Response {
  /// Initialize VerifyEmailResponse
  const VerifyEmailResponse({
    this.verifyEmail,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      VerifyEmailResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        verifyEmail:
            json['verify_email'] == null ? null : json['verify_email'] == 1,
      );

  /// 1 for success (secure code has been sent to the email address)
  final bool verifyEmail;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'verify_email': verifyEmail == null ? null : verifyEmail ? 1 : 0,
      };

  /// Creates a copy of instance with given parameters
  @override
  VerifyEmailResponse copyWith({
    bool verifyEmail,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      VerifyEmailResponse(
        verifyEmail: verifyEmail ?? this.verifyEmail,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
