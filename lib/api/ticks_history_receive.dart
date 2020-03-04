/// Autogenerated from flutter_deriv_api|lib/api/ticks_history_receive.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'response.dart';

part 'ticks_history_receive.g.dart';

///
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TicksHistoryResponse extends Response {
  ///
  TicksHistoryResponse(
      {this.candles,
      this.history,
      this.pipSize,
      this.subscription,
      int reqId,
      Map<String, dynamic> echoReq,
      String msgType,
      Map<String, dynamic> error})
      : super(reqId: reqId, echoReq: echoReq, msgType: msgType, error: error);

  /// Instance from JSON
  factory TicksHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$TicksHistoryResponseFromJson(json);

  /// Instance to JSON
  @override
  Map<String, dynamic> toJson() => _$TicksHistoryResponseToJson(this);

  // Properties
  /// Array of OHLC (open/high/low/close) price values for the given time (only for style=`candles`)
  List<Map<String, dynamic>> candles;

  /// Historic tick data for a given symbol. Note: this will always return the latest possible set of ticks with accordance to the parameters specified.
  Map<String, dynamic> history;

  /// Indicates the number of decimal points that the returned amounts must be displayed with
  num pipSize;

  /// For subscription requests only
  Map<String, dynamic> subscription;
}
