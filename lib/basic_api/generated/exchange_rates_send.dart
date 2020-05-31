/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/exchange_rates_send.json
import 'package:json_annotation/json_annotation.dart';

import '../request.dart';

part 'exchange_rates_send.g.dart';

/// JSON conversion for 'exchange_rates_send'
@JsonSerializable(nullable: true, fieldRename: FieldRename.snake)
class ExchangeRatesRequest extends Request {
  /// Initialize ExchangeRatesRequest
  const ExchangeRatesRequest({
    this.baseCurrency,
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
      _$ExchangeRatesRequestFromJson(json);

  /// Base currency (can be obtained from `payout_currencies` call)
  final String baseCurrency;

  /// Must be `1`
  final int exchangeRates;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => _$ExchangeRatesRequestToJson(this);

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
