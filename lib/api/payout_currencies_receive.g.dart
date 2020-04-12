// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payout_currencies_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayoutCurrenciesResponse _$PayoutCurrenciesResponseFromJson(
    Map<String, dynamic> json) {
  return PayoutCurrenciesResponse(
    payoutCurrencies:
        (json['payout_currencies'] as List).map((e) => e as String).toList(),
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PayoutCurrenciesResponseToJson(
        PayoutCurrenciesResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'payout_currencies': instance.payoutCurrencies,
    };
