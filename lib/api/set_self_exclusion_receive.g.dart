// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_self_exclusion_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetSelfExclusionResponse _$SetSelfExclusionResponseFromJson(
    Map<String, dynamic> json) {
  return SetSelfExclusionResponse()
    ..setSelfExclusion = json['set_self_exclusion'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$SetSelfExclusionResponseToJson(
        SetSelfExclusionResponse instance) =>
    <String, dynamic>{
      'set_self_exclusion': instance.setSelfExclusion,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
