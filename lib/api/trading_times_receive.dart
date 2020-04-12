/// generated automatically from flutter_deriv_api|lib/api/trading_times_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'trading_times_receive.g.dart';

/// JSON conversion for 'trading_times_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TradingTimesResponse extends Response {
  /// Initialize TradingTimesResponse
  TradingTimesResponse({
    this.tradingTimes,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory TradingTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$TradingTimesResponseFromJson(json);

  // Properties
  /// The trading times structure is a hierarchy as follows: Market -> SubMarket -> Underlyings
  final Map<String, dynamic> tradingTimes;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TradingTimesResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TradingTimesResponse copyWith({
    Map<String, dynamic> tradingTimes,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      TradingTimesResponse(
        tradingTimes: tradingTimes ?? this.tradingTimes,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );
}
