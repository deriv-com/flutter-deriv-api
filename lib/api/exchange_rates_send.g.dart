// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rates_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRatesRequest _$ExchangeRatesRequestFromJson(Map<String, dynamic> json) {
  return ExchangeRatesRequest(
    baseCurrency: json['base_currency'] as String,
    exchangeRates: json['exchange_rates'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$ExchangeRatesRequestToJson(
        ExchangeRatesRequest instance) =>
    <String, dynamic>{
      'base_currency': instance.baseCurrency,
      'exchange_rates': instance.exchangeRates,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
