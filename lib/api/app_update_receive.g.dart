// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUpdateResponse _$AppUpdateResponseFromJson(Map<String, dynamic> json) {
  return AppUpdateResponse(
    appUpdate: json['app_update'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AppUpdateResponseToJson(AppUpdateResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'app_update': instance.appUpdate,
    };
