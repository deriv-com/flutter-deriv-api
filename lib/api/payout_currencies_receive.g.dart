// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payout_currencies_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayoutCurrenciesResponse _$PayoutCurrenciesResponseFromJson(
    Map<String, dynamic> json) {
  return PayoutCurrenciesResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    payoutCurrencies:
        (json['payout_currencies'] as List).map((e) => e as String).toList(),
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$PayoutCurrenciesResponseToJson(
        PayoutCurrenciesResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'payout_currencies': instance.payoutCurrencies,
      'req_id': instance.reqId,
    };
