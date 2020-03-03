// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_rates_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeRatesResponse _$ExchangeRatesResponseFromJson(
    Map<String, dynamic> json) {
  return ExchangeRatesResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    exchangeRates: json['exchange_rates'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ExchangeRatesResponseToJson(
        ExchangeRatesResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'exchange_rates': instance.exchangeRates,
    };
