// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_account_currency_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetAccountCurrencyResponse _$SetAccountCurrencyResponseFromJson(
    Map<String, dynamic> json) {
  return SetAccountCurrencyResponse(
    setAccountCurrency: json['set_account_currency'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SetAccountCurrencyResponseToJson(
        SetAccountCurrencyResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'set_account_currency': instance.setAccountCurrency,
    };
