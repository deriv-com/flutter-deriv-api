/// Autogenerated from flutter_deriv_api|lib/api/ticks_history_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'ticks_history_receive.g.dart';

/// JSON conversion for 'ticks_history_receive'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class TicksHistoryResponse extends Response {
  /// Initialize TicksHistoryResponse
  TicksHistoryResponse(
      {this.candles,
      this.history,
      this.pipSize,
      this.subscription,
      Map<String, dynamic> echoReq,
      Map<String, dynamic> error,
      String msgType,
      int reqId})
      : super(echoReq: echoReq, error: error, msgType: msgType, reqId: reqId);

  /// Creates instance from JSON
  factory TicksHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$TicksHistoryResponseFromJson(json);

  // Properties
  /// Array of OHLC (open/high/low/close) price values for the given time (only for style=`candles`)
  List<Map<String, dynamic>> candles;

  /// Historic tick data for a given symbol. Note: this will always return the latest possible set of ticks with accordance to the parameters specified.
  Map<String, dynamic> history;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  num pipSize;

  /// For subscription requests only
  Map<String, dynamic> subscription;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$TicksHistoryResponseToJson(this);
}
