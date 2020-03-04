// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_list_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppListResponse _$AppListResponseFromJson(Map<String, dynamic> json) {
  return AppListResponse(
    appList: (json['app_list'] as List)
        .map((e) => e as Map<String, dynamic>)
        .toList(),
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AppListResponseToJson(AppListResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'app_list': instance.appList,
    };
