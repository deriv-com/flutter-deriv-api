/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_times_receive.json
// ignore_for_file: avoid_as

import '../response.dart';

/// Trading times receive class
class TradingTimesReceive extends Response {
  /// Initialize TradingTimesReceive
  const TradingTimesReceive({
    this.tradingTimes,
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
  factory TradingTimesReceive.fromJson(Map<String, dynamic> json) =>
      TradingTimesReceive(
        tradingTimes: json['trading_times'] as Map<String, dynamic>,
        echoReq: json['echo_req'] as Map<String, dynamic>,
        error: json['error'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// The trading times structure is a hierarchy as follows: Market -> SubMarket -> Underlyings
  final Map<String, dynamic> tradingTimes;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'trading_times': tradingTimes,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingTimesReceive copyWith({
    Map<String, dynamic> tradingTimes,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TradingTimesReceive(
        tradingTimes: tradingTimes ?? this.tradingTimes,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
