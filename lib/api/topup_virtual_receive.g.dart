// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupVirtualResponse _$TopupVirtualResponseFromJson(Map<String, dynamic> json) {
  return TopupVirtualResponse()
    ..topupVirtual = json['topup_virtual'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$TopupVirtualResponseToJson(
        TopupVirtualResponse instance) =>
    <String, dynamic>{
      'topup_virtual': instance.topupVirtual,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
