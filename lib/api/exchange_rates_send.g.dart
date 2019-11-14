// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rates_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRatesRequest _$ExchangeRatesRequestFromJson(Map<String, dynamic> json) {
  return ExchangeRatesRequest()
    ..exchangeRates = json['exchange_rates'] as int
    ..baseCurrency = json['base_currency'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ExchangeRatesRequestToJson(
        ExchangeRatesRequest instance) =>
    <String, dynamic>{
      'exchange_rates': instance.exchangeRates,
      'base_currency': instance.baseCurrency,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
