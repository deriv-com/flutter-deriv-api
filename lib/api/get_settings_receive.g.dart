// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_settings_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSettingsResponse _$GetSettingsResponseFromJson(Map<String, dynamic> json) {
  return GetSettingsResponse()
    ..getSettings = json['get_settings'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$GetSettingsResponseToJson(
        GetSettingsResponse instance) =>
    <String, dynamic>{
      'get_settings': instance.getSettings,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
