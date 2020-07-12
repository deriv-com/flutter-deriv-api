/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/time_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Time response class
class TimeResponse extends Response {
  /// Initialize TimeResponse
  const TimeResponse({
    this.time,
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
  factory TimeResponse.fromJson(Map<String, dynamic> json) => TimeResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        time: json['time'] as int,
      );

  /// Epoch of server time.
  final int time;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'time': time,
      };

  /// Creates a copy of instance with given parameters
  @override
  TimeResponse copyWith({
    int time,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TimeResponse(
        time: time ?? this.time,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
