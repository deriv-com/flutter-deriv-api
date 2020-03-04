// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_virtual_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupVirtualRequest _$TopupVirtualRequestFromJson(Map<String, dynamic> json) {
  return TopupVirtualRequest(
    topupVirtual: json['topup_virtual'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TopupVirtualRequestToJson(
        TopupVirtualRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'topup_virtual': instance.topupVirtual,
    };
