// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUpdateResponse _$AppUpdateResponseFromJson(Map<String, dynamic> json) {
  return AppUpdateResponse(
    appUpdate: json['app_update'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AppUpdateResponseToJson(AppUpdateResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'app_update': instance.appUpdate,
    };
