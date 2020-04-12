// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_get_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppGetResponse _$AppGetResponseFromJson(Map<String, dynamic> json) {
  return AppGetResponse(
    appGet: json['app_get'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AppGetResponseToJson(AppGetResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'app_get': instance.appGet,
    };
