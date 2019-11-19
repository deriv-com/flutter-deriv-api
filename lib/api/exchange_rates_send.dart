/// Autogenerated from flutter_deriv_api|lib/api/exchange_rates_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'exchange_rates_send.g.dart';

@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ExchangeRatesRequest {
  ExchangeRatesRequest();
  factory ExchangeRatesRequest.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ExchangeRatesRequestToJson(this);

  // Properties
  /// Base currency (can be obtained from payout_currencies call)
  String baseCurrency;

  /// Must be 1
  int exchangeRates;

  /// [Optional] Used to pass data through the websocket, which may be retrieved via the echo_req output field.
  Map<String, dynamic> passthrough;

  /// [Optional] Used to map request to response.
  int reqId;

  // @override
  // String toString() => name;
  static bool _fromInteger(int v) => (v != 0);
  static int _fromBoolean(bool v) => v ? 1 : 0;
}
