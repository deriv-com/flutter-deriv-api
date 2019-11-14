// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_account_currency_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetAccountCurrencyResponse _$SetAccountCurrencyResponseFromJson(
    Map<String, dynamic> json) {
  return SetAccountCurrencyResponse()
    ..setAccountCurrency = json['set_account_currency'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$SetAccountCurrencyResponseToJson(
        SetAccountCurrencyResponse instance) =>
    <String, dynamic>{
      'set_account_currency': instance.setAccountCurrency,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
