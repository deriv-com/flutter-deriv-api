/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/ticks_history_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Ticks history receive class.
class TicksHistoryReceive extends Response {
  /// Initialize TicksHistoryReceive.
  const TicksHistoryReceive({
    this.candles,
    this.history,
    this.pipSize,
    this.subscription,
    super.echoReq,
    super.error,
    super.msgType,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory TicksHistoryReceive.fromJson(Map<String, dynamic> json) =>
      TicksHistoryReceive(
        candles: (json['candles'] as List<dynamic>?)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            .toList(),
        history: json['history'] as Map<String, dynamic>?,
        pipSize: json['pip_size'] as num?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Array of OHLC (open/high/low/close) price values for the given time (only for style=`candles`)
  final List<Map<String, dynamic>>? candles;

  /// Historic tick data for a given symbol. Note: this will always return the latest possible set of ticks with accordance to the parameters specified.
  final Map<String, dynamic>? history;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  final num? pipSize;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'candles': candles,
        'history': history,
        'pip_size': pipSize,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TicksHistoryReceive copyWith({
    List<Map<String, dynamic>>? candles,
    Map<String, dynamic>? history,
    num? pipSize,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      TicksHistoryReceive(
        candles: candles ?? this.candles,
        history: history ?? this.history,
        pipSize: pipSize ?? this.pipSize,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
