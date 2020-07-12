/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/exchange_rates_receive.json
// ignore_for_file: avoid_as, always_specify_types

import '../response.dart';

/// Exchange rates response class
class ExchangeRatesResponse extends Response {
  /// Initialize ExchangeRatesResponse
  const ExchangeRatesResponse({
    this.exchangeRates,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON
  factory ExchangeRatesResponse.fromJson(Map<String, dynamic> json) =>
      ExchangeRatesResponse(
        echoReq: json['echo_req'] as Map<String, dynamic>,
        exchangeRates: json['exchange_rates'] as Map<String, dynamic>,
        msgType: json['msg_type'] as String,
        reqId: json['req_id'] as int,
      );

  /// Exchange rate values from base to all other currencies
  final Map<String, dynamic> exchangeRates;

  /// Converts an instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'echo_req': echoReq,
        'exchange_rates': exchangeRates,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ExchangeRatesResponse copyWith({
    Map<String, dynamic> exchangeRates,
    Map<String, dynamic> echoReq,
    Map<String, dynamic> error,
    String msgType,
    int reqId,
  }) =>
      ExchangeRatesResponse(
        exchangeRates: exchangeRates ?? this.exchangeRates,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class
  @override
  List<Object> get props => null;
}
