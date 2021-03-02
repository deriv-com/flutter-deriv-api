/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_durations_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Trading durations receive class
class TradingDurationsReceive extends Response {
  /// Initialize TradingDurationsReceive
  const TradingDurationsReceive({
    this.tradingDurations,
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
  factory TradingDurationsReceive.fromJson(Map<String, dynamic> json) =>
      TradingDurationsReceive(
        tradingDurations: (json['trading_durations'] as List<dynamic>)
            ?.map<Map<String, dynamic>>(
                (dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// List of underlyings by their display name and symbol followed by their available contract types and trading duration boundaries.
  final List<Map<String, dynamic>> tradingDurations;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_durations': tradingDurations,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingDurationsReceive copyWith({
    List<Map<String, dynamic>> tradingDurations,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TradingDurationsReceive(
        tradingDurations: tradingDurations ?? this.tradingDurations,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
