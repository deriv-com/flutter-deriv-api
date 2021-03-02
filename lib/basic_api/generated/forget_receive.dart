/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/forget_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Forget receive class
class ForgetReceive extends Response {
  /// Initialize ForgetReceive
  const ForgetReceive({
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
  factory ForgetReceive.fromJson(Map<String, dynamic> json) => ForgetReceive(
        forget: json['forget'] == null ? null : json['forget'] == 1,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// If set to `true`, stream exited and stopped. If set to `false`, stream did not exist.
  final bool forget;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'forget': forget == null
            ? null
            : forget
                ? 1
                : 0,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ForgetReceive copyWith({
    bool forget,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ForgetReceive(
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
