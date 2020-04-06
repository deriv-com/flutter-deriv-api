/// Autogenerated from flutter_deriv_api|lib/api/exchange_rates_send.json
import 'dart:async';
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'request.dart';

part 'exchange_rates_send.g.dart';

/// JSON conversion for 'exchange_rates_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ExchangeRatesRequest extends Request {
  /// Initialize ExchangeRatesRequest
  ExchangeRatesRequest({
    this.baseCurrency,
    this.exchangeRates = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'exchange_rates',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates instance from JSON
  factory ExchangeRatesRequest.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesRequestFromJson(json);

  // Properties
  /// Base currency (can be obtained from `payout_currencies` call)
  String baseCurrency;

  /// Must be `1`
  int exchangeRates;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ExchangeRatesRequestToJson(this);
}
