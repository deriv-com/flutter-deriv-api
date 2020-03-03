// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_register_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppRegisterResponse _$AppRegisterResponseFromJson(Map<String, dynamic> json) {
  return AppRegisterResponse(
    appRegister: json['app_register'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$AppRegisterResponseToJson(
        AppRegisterResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'app_register': instance.appRegister,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
