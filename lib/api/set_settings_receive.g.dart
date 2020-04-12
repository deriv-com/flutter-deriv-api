// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_settings_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetSettingsResponse _$SetSettingsResponseFromJson(Map<String, dynamic> json) {
  return SetSettingsResponse(
    setSettings: json['set_settings'] as int,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$SetSettingsResponseToJson(
        SetSettingsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'set_settings': instance.setSettings,
    };
