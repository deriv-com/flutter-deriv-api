/// Generated automatically from flutter_deriv_api|lib/basic_api/generated/exchange_rates_receive.json.

// ignore_for_file: always_put_required_named_parameters_first

import '../response.dart';

/// Exchange rates receive class.
class ExchangeRatesReceive extends Response {
  /// Initialize ExchangeRatesReceive.
  const ExchangeRatesReceive({
    this.exchangeRates,
    this.subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) : super(
          echoReq: echoReq,
          error: error,
          msgType: msgType,
          reqId: reqId,
        );

  /// Creates an instance from JSON.
  factory ExchangeRatesReceive.fromJson(Map<String, dynamic> json) =>
      ExchangeRatesReceive(
        exchangeRates: json['exchange_rates'] as Map<String, dynamic>?,
        subscription: json['subscription'] as Map<String, dynamic>?,
        echoReq: json['echo_req'] as Map<String, dynamic>?,
        error: json['error'] as Map<String, dynamic>?,
        msgType: json['msg_type'] as String?,
        reqId: json['req_id'] as int?,
      );

  /// Exchange rate values from base to all other currencies
  final Map<String, dynamic>? exchangeRates;

  /// For subscription requests only.
  final Map<String, dynamic>? subscription;

  /// Converts this instance to JSON
  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'exchange_rates': exchangeRates,
        'subscription': subscription,
        'echo_req': echoReq,
        'error': error,
        'msg_type': msgType,
        'req_id': reqId,
      };

  /// Creates a copy of instance with given parameters
  @override
  ExchangeRatesReceive copyWith({
    Map<String, dynamic>? exchangeRates,
    Map<String, dynamic>? subscription,
    Map<String, dynamic>? echoReq,
    Map<String, dynamic>? error,
    String? msgType,
    int? reqId,
  }) =>
      ExchangeRatesReceive(
        exchangeRates: exchangeRates ?? this.exchangeRates,
        subscription: subscription ?? this.subscription,
        echoReq: echoReq ?? this.echoReq,
        error: error ?? this.error,
        msgType: msgType ?? this.msgType,
        reqId: reqId ?? this.reqId,
      );

  /// Override equatable class.
  @override
  List<Object?> get props => <Object?>[];
}
