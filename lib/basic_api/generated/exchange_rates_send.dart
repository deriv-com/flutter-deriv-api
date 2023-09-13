/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/exchange_rates_send.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../request.dart';

/// Exchange rates request class.
class ExchangeRatesRequest extends Request {
  /// Initialize ExchangeRatesRequest.
  const ExchangeRatesRequest({
    required this.baseCurrency,
    this.exchangeRates = true,
    this.subscribe,
    this.targetCurrency,
    super.msgType = 'exchange_rates',
    super.passthrough,
    super.reqId,
  });

  /// Creates an instance from JSON.
  factory ExchangeRatesRequest.fromJson(Map<String, dynamic> json) =>
      ExchangeRatesRequest(
        baseCurrency: json['base_currency'] as String?,
        exchangeRates:
            json['exchange_rates'] == null ? null : json['exchange_rates'] == 1,
        subscribe: json['subscribe'] == null ? null : json['subscribe'] == 1,
        targetCurrency: json['target_currency'] as String?,
        passthrough: json['passthrough'] as Map<String, dynamic>?,
        reqId: json['req_id'] as int?,
      );

  /// Base currency (can be obtained from `payout_currencies` call)
  final String? baseCurrency;

  /// Must be `true`
  final bool? exchangeRates;

  /// [Optional] `true` - to initiate a realtime stream of exchange rates relative to base currency.
  final bool? subscribe;

  /// [Optional] Local currency
  final String? targetCurrency;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'base_currency': baseCurrency,
        'exchange_rates': exchangeRates == null
            ? null
            : exchangeRates!
                ? 1
                : 0,
        'subscribe': subscribe == null
            ? null
            : subscribe!
                ? 1
                : 0,
        'target_currency': targetCurrency,
        'passthrough': passthrough,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ExchangeRatesRequest copyWith({
    String? baseCurrency,
    bool? exchangeRates,
    bool? subscribe,
    String? targetCurrency,
    Map<String, dynamic>? passthrough,
    int? reqId,
  }) =>
      ExchangeRatesRequest(
        baseCurrency: baseCurrency ?? this.baseCurrency,
        exchangeRates: exchangeRates ?? this.exchangeRates,
        subscribe: subscribe ?? this.subscribe,
        targetCurrency: targetCurrency ?? this.targetCurrency,
        passthrough: passthrough ?? this.passthrough,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
