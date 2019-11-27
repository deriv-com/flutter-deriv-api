// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reality_check_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealityCheckResponse _$RealityCheckResponseFromJson(Map<String, dynamic> json) {
  return RealityCheckResponse()
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..realityCheck = json['reality_check'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$RealityCheckResponseToJson(
        RealityCheckResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'reality_check': instance.realityCheck,
      'req_id': instance.reqId,
    };
