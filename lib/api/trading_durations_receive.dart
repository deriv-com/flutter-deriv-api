/// generated automatically from flutter_deriv_api|lib/api/trading_durations_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'trading_durations_receive.g.dart';

/// JSON conversion for 'trading_durations_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TradingDurationsResponse extends Response {
  /// Initialize TradingDurationsResponse
  const TradingDurationsResponse({
    this.tradingDurations,
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
  factory TradingDurationsResponse.fromJson(Map<String, dynamic> json) =>
      _$TradingDurationsResponseFromJson(json);

  // Properties
  /// List of underlyings by their display name and symbol followed by their available contract types and trading duration boundaries.
  final List<Map<String, dynamic>> tradingDurations;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TradingDurationsResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  TradingDurationsResponse copyWith({
    List<Map<String, dynamic>> tradingDurations,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      TradingDurationsResponse(
        tradingDurations: tradingDurations ?? this.tradingDurations,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
