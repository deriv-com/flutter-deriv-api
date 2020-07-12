/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Ticks response class
class TicksResponse extends Response {
  /// Initialize TicksResponse
  const TicksResponse({
    this.subscription,
    this.tick,
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
  factory TicksResponse.fromJson(Map<String, dynamic> json) => TicksResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        subscription: json['subscription'] as Map<String, dynamic>,
        tick: json['tick'] as Map<String, dynamic>,
      );

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Tick by tick list of streamed data
  final Map<String, dynamic> tick;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'subscription': subscription,
        'tick': tick,
      };

  /// Creates a copy of instance with given parameters
  @override
  TicksResponse copyWith({
    Map<String, dynamic> subscription,
    Map<String, dynamic> tick,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TicksResponse(
        subscription: subscription ?? this.subscription,
        tick: tick ?? this.tick,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
