// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_self_exclusion_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSelfExclusionResponse _$GetSelfExclusionResponseFromJson(
    Map<String, dynamic> json) {
  return GetSelfExclusionResponse(
    getSelfExclusion: json['get_self_exclusion'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GetSelfExclusionResponseToJson(
        GetSelfExclusionResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'get_self_exclusion': instance.getSelfExclusion,
    };
