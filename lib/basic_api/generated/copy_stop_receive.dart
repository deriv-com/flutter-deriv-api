/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_stop_receive.json

import '../response.dart';

/// CopyStopResponse class
class CopyStopResponse extends Response {
  /// Initialize CopyStopResponse
  const CopyStopResponse({
    this.copyStop,
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
  factory CopyStopResponse.fromJson(Map<String, dynamic> json) =>
      CopyStopResponse(
        // ignore: avoid_as
        copyStop: json['copy_stop'] as int,
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Copy stopping confirmation. Returns 1 is success.
  final int copyStop;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copy_stop': copyStop,
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopyStopResponse copyWith({
    int copyStop,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CopyStopResponse(
        copyStop: copyStop ?? this.copyStop,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
