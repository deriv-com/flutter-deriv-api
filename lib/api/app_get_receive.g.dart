// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_get_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppGetResponse _$AppGetResponseFromJson(Map<String, dynamic> json) {
  return AppGetResponse(
    appGet: json['app_get'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AppGetResponseToJson(AppGetResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'app_get': instance.appGet,
    };
