/// generated automatically from flutter_deriv_api|lib/basic_api/generated/trading_times_receive.json
import 'package:json_annotation/json_annotation.dart';

import '../response.dart';

part 'trading_times_receive.g.dart';

/// JSON conversion for 'trading_times_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
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
      _$TradingTimesResponseFromJson(json);

  // Properties
  /// The trading times structure is a hierarchy as follows: Market -> SubMarket -> Underlyings
  final Map<String, dynamic> tradingTimes;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$TradingTimesResponseToJson(this);

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
