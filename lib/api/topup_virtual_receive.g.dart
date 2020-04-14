// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupVirtualResponse _$TopupVirtualResponseFromJson(Map<String, dynamic> json) {
  return TopupVirtualResponse(
    topupVirtual: json['topup_virtual'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$TopupVirtualResponseToJson(
        TopupVirtualResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'topup_virtual': instance.topupVirtual,
    };
