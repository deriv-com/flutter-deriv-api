// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topup_virtual_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopupVirtualResponse _$TopupVirtualResponseFromJson(Map<String, dynamic> json) {
  return TopupVirtualResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int
    ..topupVirtual = json['topup_virtual'] as Map<String, dynamic>;
}

Map<String, dynamic> _$TopupVirtualResponseToJson(
        TopupVirtualResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'topup_virtual': instance.topupVirtual,
    };
