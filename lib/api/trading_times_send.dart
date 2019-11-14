/// Autogenerated from flutter_deriv_api|lib/api/trading_times_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'trading_times_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class TradingTimesRequest {
  TradingTimesRequest();
  factory TradingTimesRequest.fromJson(Map<String, dynamic> json) =>
      _$TradingTimesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$TradingTimesRequestToJson(this);

  // Properties
  String tradingTimes;

  /// Date to receive market opening times for. (yyyy-mm-dd format. 'today' can also be specified).
  Map<String, dynamic> passthrough;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  int reqId;

  /// [Optional] Used to map request to response.

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
