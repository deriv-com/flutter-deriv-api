// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_delete_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDeleteResponse _$AppDeleteResponseFromJson(Map<String, dynamic> json) {
  return AppDeleteResponse(
    appDelete: json['app_delete'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AppDeleteResponseToJson(AppDeleteResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'app_delete': instance.appDelete,
    };
