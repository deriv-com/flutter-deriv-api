// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_account_currency_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetAccountCurrencyRequest _$SetAccountCurrencyRequestFromJson(
    Map<String, dynamic> json) {
  return SetAccountCurrencyRequest(
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    setAccountCurrency: json['set_account_currency'] as String,
  );
}

Map<String, dynamic> _$SetAccountCurrencyRequestToJson(
        SetAccountCurrencyRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'set_account_currency': instance.setAccountCurrency,
    };
