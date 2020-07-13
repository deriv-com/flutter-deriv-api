/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/exchange_rates_send.json
// ignore_for_file: avoid_as, always_specify_types

import 'package:meta/meta.dart';

import '../request.dart';

/// Exchange rates request class
class ExchangeRatesRequest extends Request {
  /// Initialize ExchangeRatesRequest
  const ExchangeRatesRequest({
    @required this.baseCurrency,
    this.exchangeRates = true,
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
        baseCurrency: json['base_currency'] as String,
        exchangeRates:
            json['exchange_rates'] == null ? null : json['exchange_rates'] == 1,
        passthrough: json['passthrough'] as Map<String, dynamic>,
        reqId: json['req_id'] as int,
      );

  /// Base currency (can be obtained from `payout_currencies` call)
  final String baseCurrency;

  /// Must be `true`
  final bool exchangeRates;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'base_currency': baseCurrency,
        'exchange_rates': exchangeRates == null ? null : exchangeRates ? 1 : 0,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ExchangeRatesRequest copyWith({
    String baseCurrency,
    bool exchangeRates,
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
