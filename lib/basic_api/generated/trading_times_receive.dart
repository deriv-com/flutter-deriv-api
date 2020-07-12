/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_times_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// TradingTimesResponse class
class TradingTimesResponse extends Response {
  /// Initialize TradingTimesResponse
  const TradingTimesResponse({
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
  factory TradingTimesResponse.fromJson(Map<String, dynamic> json) =>
      TradingTimesResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
        tradingTimes: json['trading_times'] as Map<String, dynamic>,
      );

  /// The trading times structure is a hierarchy as follows: Market -> SubMarket -> Underlyings
  final Map<String, dynamic> tradingTimes;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'trading_times': tradingTimes,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingTimesResponse copyWith({
    Map<String, dynamic> tradingTimes,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TradingTimesResponse(
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
