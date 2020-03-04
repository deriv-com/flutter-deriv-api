// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_delete_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDeleteResponse _$AppDeleteResponseFromJson(Map<String, dynamic> json) {
  return AppDeleteResponse(
    appDelete: json['app_delete'] as int,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AppDeleteResponseToJson(AppDeleteResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'app_delete': instance.appDelete,
    };
