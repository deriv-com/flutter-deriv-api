// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_limits_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLimitsResponse _$GetLimitsResponseFromJson(Map<String, dynamic> json) {
  return GetLimitsResponse()
    ..getLimits = json['get_limits'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$GetLimitsResponseToJson(GetLimitsResponse instance) =>
    <String, dynamic>{
      'get_limits': instance.getLimits,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
