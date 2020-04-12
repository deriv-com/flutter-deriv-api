// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupVirtualResponse _$TopupVirtualResponseFromJson(Map<String, dynamic> json) {
  return TopupVirtualResponse(
    topupVirtual: json['topup_virtual'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$TopupVirtualResponseToJson(
        TopupVirtualResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'topup_virtual': instance.topupVirtual,
    };
