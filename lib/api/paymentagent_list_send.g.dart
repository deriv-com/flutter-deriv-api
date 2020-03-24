// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentListRequest _$PaymentagentListRequestFromJson(
    Map<String, dynamic> json) {
  return PaymentagentListRequest(
    currency: json['currency'] as String,
    paymentagentList: json['paymentagent_list'] as String,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$PaymentagentListRequestToJson(
        PaymentagentListRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'currency': instance.currency,
      'paymentagent_list': instance.paymentagentList,
    };
