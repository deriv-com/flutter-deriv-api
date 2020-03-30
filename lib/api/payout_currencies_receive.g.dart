// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payout_currencies_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayoutCurrenciesResponse _$PayoutCurrenciesResponseFromJson(
    Map<String, dynamic> json) {
  return PayoutCurrenciesResponse(
    payoutCurrencies:
        (json['payout_currencies'] as List)?.map((e) => e as String)?.toList(),
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$PayoutCurrenciesResponseToJson(
        PayoutCurrenciesResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'payout_currencies': instance.payoutCurrencies,
    };
