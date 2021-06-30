import '../response.dart';

/// JSON conversion for OHLC response.
class OHLCResponse extends Response {
  /// Initialize OHLCResponse.
  const OHLCResponse({
    this.subscription,
    this.ohlc,
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
  factory OHLCResponse.fromJson(Map<String, dynamic> json) => OHLCResponse(
        subscription: json['subscription'] as Map<String, dynamic>?,
        ohlc: json['ohlc'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Tick by tick list of streamed ohlc data.
  final Map<String, dynamic>? ohlc;

  /// Converts an instance to JSON.
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
        'subscription': subscription,
        'ohlc': ohlc,
      };

  /// Creates a copy of instance with given parameters.
  @override
  OHLCResponse copyWith({
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? ohlc,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      OHLCResponse(
        subscription: subscription ?? this.subscription,
        ohlc: ohlc ?? this.ohlc,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object> get props => <Object>[];
}
