// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_limits_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLimitsResponse _$GetLimitsResponseFromJson(Map<String, dynamic> json) {
  return GetLimitsResponse(
    getLimits: json['get_limits'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GetLimitsResponseToJson(GetLimitsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'get_limits': instance.getLimits,
    };
