// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reality_check_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealityCheckResponse _$RealityCheckResponseFromJson(Map<String, dynamic> json) {
  return RealityCheckResponse(
    realityCheck: json['reality_check'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$RealityCheckResponseToJson(
        RealityCheckResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'reality_check': instance.realityCheck,
    };
