// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_settings_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetSettingsResponse _$SetSettingsResponseFromJson(Map<String, dynamic> json) {
  return SetSettingsResponse()
    ..setSettings = json['set_settings'] as int
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$SetSettingsResponseToJson(
        SetSettingsResponse instance) =>
    <String, dynamic>{
      'set_settings': instance.setSettings,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
