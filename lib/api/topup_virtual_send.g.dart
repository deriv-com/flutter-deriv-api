// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_virtual_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupVirtualRequest _$TopupVirtualRequestFromJson(Map<String, dynamic> json) {
  return TopupVirtualRequest(
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    topupVirtual: json['topup_virtual'] as int,
  );
}

Map<String, dynamic> _$TopupVirtualRequestToJson(
        TopupVirtualRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'topup_virtual': instance.topupVirtual,
    };
