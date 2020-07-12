/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Forget response class
class ForgetResponse extends Response {
  /// Initialize ForgetResponse
  const ForgetResponse({
    this.forget,
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
  factory ForgetResponse.fromJson(Map<String, dynamic> json) => ForgetResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        forget: json['forget'] == null ? null : json['forget'] == 1,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// If set to 1, stream exited and stopped. If set to 0, stream did not exist.
  final bool forget;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'forget': forget == null ? null : forget ? 1 : 0,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ForgetResponse copyWith({
    bool forget,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ForgetResponse(
        forget: forget ?? this.forget,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
