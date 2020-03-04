// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_register_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppRegisterResponse _$AppRegisterResponseFromJson(Map<String, dynamic> json) {
  return AppRegisterResponse(
    appRegister: json['app_register'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AppRegisterResponseToJson(
        AppRegisterResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'app_register': instance.appRegister,
    };
