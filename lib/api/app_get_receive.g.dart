// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_get_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppGetResponse _$AppGetResponseFromJson(Map<String, dynamic> json) {
  return AppGetResponse()
    ..appGet = json['app_get'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$AppGetResponseToJson(AppGetResponse instance) =>
    <String, dynamic>{
      'app_get': instance.appGet,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
