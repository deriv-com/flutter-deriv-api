// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetResponse _$ForgetResponseFromJson(Map<String, dynamic> json) {
  return ForgetResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    forget: json['forget'] as int,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$ForgetResponseToJson(ForgetResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'forget': instance.forget,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
