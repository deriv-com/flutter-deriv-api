// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logout_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogoutResponse _$LogoutResponseFromJson(Map<String, dynamic> json) {
  return LogoutResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    logout: json['logout'] as int,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$LogoutResponseToJson(LogoutResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'logout': instance.logout,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
