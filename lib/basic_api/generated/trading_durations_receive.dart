/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_durations_receive.json

import '../response.dart';

/// TradingDurationsResponse class
class TradingDurationsResponse extends Response {
  /// Initialize TradingDurationsResponse
  const TradingDurationsResponse({
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
  factory TradingDurationsResponse.fromJson(Map<String, dynamic> json) =>
      TradingDurationsResponse(
        // ignore: avoid_as
        echoReq: json['echo_req'] as Map<String, dynamic>,
        // ignore: avoid_as
        msgType: json['msg_type'] as String,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
        // ignore: avoid_as, always_specify_types
        tradingDurations: (json['trading_durations'] as List)
            // ignore: avoid_as
            ?.map((dynamic item) => item as Map<String, dynamic>)
            ?.toList(),
      );

  /// List of underlyings by their display name and symbol followed by their available contract types and trading duration boundaries.
  final List<Map<String, dynamic>> tradingDurations;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'msg_type': msgType,
        'req_id': reqId,
        'trading_durations': tradingDurations,
      };

  /// Creates a copy of instance with given parameters
  @override
  TradingDurationsResponse copyWith({
    List<Map<String, dynamic>> tradingDurations,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      TradingDurationsResponse(
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
