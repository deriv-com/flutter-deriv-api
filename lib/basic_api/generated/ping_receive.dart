/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ping_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Ping response class
class PingResponse extends Response {
  /// Initialize PingResponse
  const PingResponse({
    this.ping,
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
  factory PingResponse.fromJson(Map<String, dynamic> json) => PingResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        ping: json['ping'] as String,
        reqId: json['req_id'] as int,
      );

  /// Will return 'pong'
  final String ping;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'ping': ping,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  PingResponse copyWith({
    String ping,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      PingResponse(
        ping: ping ?? this.ping,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
