/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/copy_stop_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Copy stop receive class
class CopyStopReceive extends Response {
  /// Initialize CopyStopReceive
  const CopyStopReceive({
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
  factory CopyStopReceive.fromJson(Map<String, dynamic> json) =>
      CopyStopReceive(
        copyStop: json['copy_stop'] as int,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Copy stopping confirmation. Returns 1 is success.
  final int copyStop;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'copy_stop': copyStop,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  CopyStopReceive copyWith({
    int copyStop,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      CopyStopReceive(
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
