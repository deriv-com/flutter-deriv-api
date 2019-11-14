// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetResponse _$ForgetResponseFromJson(Map<String, dynamic> json) {
  return ForgetResponse()
    ..forget = json['forget'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$ForgetResponseToJson(ForgetResponse instance) =>
    <String, dynamic>{
      'forget': instance.forget,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
