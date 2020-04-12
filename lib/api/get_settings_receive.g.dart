// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_settings_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSettingsResponse _$GetSettingsResponseFromJson(Map<String, dynamic> json) {
  return GetSettingsResponse(
    getSettings: json['get_settings'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$GetSettingsResponseToJson(
        GetSettingsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'get_settings': instance.getSettings,
    };
