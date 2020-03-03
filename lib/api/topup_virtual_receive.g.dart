// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupVirtualResponse _$TopupVirtualResponseFromJson(Map<String, dynamic> json) {
  return TopupVirtualResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
    topupVirtual: json['topup_virtual'] as Map<String, dynamic>,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$TopupVirtualResponseToJson(
        TopupVirtualResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'topup_virtual': instance.topupVirtual,
    };
