/// generated automatically from flutter_deriv_api|lib/api/exchange_rates_receive.json
import 'package:json_annotation/json_annotation.dart';

import 'response.dart';

part 'exchange_rates_receive.g.dart';

/// JSON conversion for 'exchange_rates_receive'
@JsonSerializable(nullable: false, fieldRename: FieldRename.snake)
class ExchangeRatesResponse extends Response {
  /// Initialize ExchangeRatesResponse
  const ExchangeRatesResponse({
    this.exchangeRates,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) : super(
          reqId: reqId,
          msgType: msgType,
          echoReq: echoReq,
          error: error,
        );

  /// Creates instance from JSON
  factory ExchangeRatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ExchangeRatesResponseFromJson(json);

  // Properties
  /// Exchange rate values from base to all other currencies
  final Map<String, dynamic> exchangeRates;

  /// Converts to JSON
  @override
  Map<String, dynamic> toJson() => _$ExchangeRatesResponseToJson(this);

  /// Creates copy of instance with given parameters
  @override
  ExchangeRatesResponse copyWith({
    Map<String, dynamic> exchangeRates,
    int reqId,
    String msgType,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
  }) =>
      ExchangeRatesResponse(
        exchangeRates: exchangeRates ?? this.exchangeRates,
        reqId: reqId ?? this.reqId,
        msgType: msgType ?? this.msgType,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
