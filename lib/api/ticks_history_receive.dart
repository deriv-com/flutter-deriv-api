/// generated automatically from flutter_deriv_api|lib/api/ticks_history_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'ticks_history_receive.g.dart';

/// JSON conversion for 'ticks_history_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
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

  /// Creates instance from JSON
  factory TicksHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$TicksHistoryResponseFromJson(json);

  // Properties
  /// Array of OHLC (open/high/low/close) price values for the given time (only for style=`candles`)
  final List<Map<String, dynamic>> candles;

  /// Historic tick data for a given symbol. Note: this will always return the latest possible set of ticks with accordance to the parameters specified.
  final Map<String, dynamic> history;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  final num pipSize;

  /// For subscription requests only.
  final Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TicksHistoryResponseToJson(this);

  /// Creates copy of instance with given parameters
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
