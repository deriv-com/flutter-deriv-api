// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentagent_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentagentListRequest _$PaymentagentListRequestFromJson(
    Map<String, dynamic> json) {
  return PaymentagentListRequest()
    ..currency = json['currency'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..paymentagentList = json['paymentagent_list'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$PaymentagentListRequestToJson(
        PaymentagentListRequest instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'passthrough': instance.passthrough,
      'paymentagent_list': instance.paymentagentList,
      'req_id': instance.reqId,
    };
