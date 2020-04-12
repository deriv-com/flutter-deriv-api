/// generated automatically from flutter_deriv_api|lib/api/exchange_rates_send.json
import 'package:json_annotation/json_annotation.dart';

import 'request.dart';

part 'exchange_rates_send.g.dart';

/// JSON conversion for 'exchange_rates_send'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ExchangeRatesRequest extends Request {
  /// Initialize ExchangeRatesRequest
  const ExchangeRatesRequest({
    this.baseCurrency,
    this.exchangeRates = 1,
    int reqId,
    Map<String, dynamic> passthrough,
  }) : super(
          reqId: reqId,
          passthrough: passthrough,
        );

  /// Creates instance from JSON
  factory ExchangeRatesRequest.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesRequestFromJson(json);

  // Properties
  /// Base currency (can be obtained from `payout_currencies` call)
  final String baseCurrency;

  /// Must be `1`
  final int exchangeRates;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ExchangeRatesRequestToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ExchangeRatesRequest copyWith({
    String baseCurrency,
    int exchangeRates,
    int reqId,
    Map<String, dynamic> passthrough,
  }) =>
      ExchangeRatesRequest(
        baseCurrency: baseCurrency ?? this.baseCurrency,
        exchangeRates: exchangeRates ?? this.exchangeRates,
        reqId: reqId ?? this.reqId,
        passthrough: passthrough ?? this.passthrough,
      );

  /// Override equatable class
  @override
  List<Object> get props => <Object>[];
}
