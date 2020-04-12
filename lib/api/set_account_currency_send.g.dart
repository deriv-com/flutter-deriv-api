// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_account_currency_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetAccountCurrencyRequest _$SetAccountCurrencyRequestFromJson(
    Map<String, dynamic> json) {
  return SetAccountCurrencyRequest(
    setAccountCurrency: json['set_account_currency'] as String,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SetAccountCurrencyRequestToJson(
        SetAccountCurrencyRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'set_account_currency': instance.setAccountCurrency,
    };
