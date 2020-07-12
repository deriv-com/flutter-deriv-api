/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_history_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Ticks history response class
class TicksHistoryResponse extends Response {
  /// Initialize TicksHistoryResponse
  const TicksHistoryResponse({
    this.candles,
    this.history,
    this.pipSize,
    this.subscription,
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
  factory TicksHistoryResponse.fromJson(Map<String, dynamic> json) =>
      TicksHistoryResponse(
        candles: (json['candles'] as List)
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>,
        history: json['history'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        pipSize: json['pip_size'] as num,
        reqId: json['req_id'] as int,
        subscription: json['subscription'] as Map<String, dynamic>,
      );

  /// Array of OHLC (open/high/low/close) price values for the given time (only for style=`candles`)
  final List<Map<String, dynamic>> candles;

  /// Historic tick data for a given symbol. Note: this will always return the latest possible set of ticks with accordance to the parameters specified.
  final Map<String, dynamic> history;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  final num pipSize;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'candles': candles,
        'echo_req': echoReq,
        'history': history,
        'msg_type': msgType,
        'pip_size': pipSize,
        'req_id': reqId,
        'subscription': subscription,
      };

  /// Creates a copy of instance with given parameters
  @override
  TicksHistoryResponse copyWith({
    List<Map<String, dynamic>> candles,
    Map<String, dynamic> history,
    num pipSize,
    Map<String, dynamic> subscription,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TicksHistoryResponse(
        candles: candles ?? this.candles,
        history: history ?? this.history,
        pipSize: pipSize ?? this.pipSize,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
