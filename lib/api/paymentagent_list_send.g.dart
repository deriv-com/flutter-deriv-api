// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentListRequest _$PaymentagentListRequestFromJson(
    Map<String, dynamic> json) {
  return PaymentagentListRequest()
    ..paymentagentList = json['paymentagent_list'] as String
    ..currency = json['currency'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PaymentagentListRequestToJson(
        PaymentagentListRequest instance) =>
    <String, dynamic>{
      'paymentagent_list': instance.paymentagentList,
      'currency': instance.currency,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
