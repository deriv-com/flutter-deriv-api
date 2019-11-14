// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_self_exclusion_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSelfExclusionResponse _$GetSelfExclusionResponseFromJson(
    Map<String, dynamic> json) {
  return GetSelfExclusionResponse()
    ..getSelfExclusion = json['get_self_exclusion'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$GetSelfExclusionResponseToJson(
        GetSelfExclusionResponse instance) =>
    <String, dynamic>{
      'get_self_exclusion': instance.getSelfExclusion,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
