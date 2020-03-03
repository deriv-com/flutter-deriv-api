// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_settings_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSettingsResponse _$GetSettingsResponseFromJson(Map<String, dynamic> json) {
  return GetSettingsResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    getSettings: json['get_settings'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$GetSettingsResponseToJson(
        GetSettingsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'get_settings': instance.getSettings,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
