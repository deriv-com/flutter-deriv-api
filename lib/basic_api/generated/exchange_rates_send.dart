/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/exchange_rates_send.json

import 'package:meta/meta.dart';

import '../request.dart';

/// ExchangeRatesRequest class
class ExchangeRatesRequest extends Request {
  /// Initialize ExchangeRatesRequest
  const ExchangeRatesRequest({
    @required this.baseCurrency,
    this.exchangeRates = 1,
    Map<String, dynamic> passthrough,
    int reqId,
  }) : super(
          msgType: 'exchange_rates',
          passthrough: passthrough,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ExchangeRatesRequest.fromJson(Map<String, dynamic> json) =>
      ExchangeRatesRequest(
        // ignore: avoid_as
        baseCurrency: json['base_currency'] as String,
        // ignore: avoid_as
        exchangeRates: json['exchange_rates'] as int,
        // ignore: avoid_as
        passthrough: json['passthrough'] as Map<String, dynamic>,
        // ignore: avoid_as
        reqId: json['req_id'] as int,
      );

  /// Base currency (can be obtained from `payout_currencies` call)
  final String baseCurrency;

  /// Must be `1`
  final int exchangeRates;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'base_currency': baseCurrency,
        'exchange_rates': exchangeRates,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ExchangeRatesRequest copyWith({
    String baseCurrency,
    int exchangeRates,
    Map<String, dynamic> passthrough,
    int reqId,
  }) =>
      ExchangeRatesRequest(
        baseCurrency: baseCurrency ?? this.baseCurrency,
        exchangeRates: exchangeRates ?? this.exchangeRates,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
