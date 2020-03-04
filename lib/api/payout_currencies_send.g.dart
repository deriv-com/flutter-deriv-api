// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payout_currencies_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayoutCurrenciesRequest _$PayoutCurrenciesRequestFromJson(
    Map<String, dynamic> json) {
  return PayoutCurrenciesRequest(
    payoutCurrencies: json['payout_currencies'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$PayoutCurrenciesRequestToJson(
        PayoutCurrenciesRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'payout_currencies': instance.payoutCurrencies,
    };
