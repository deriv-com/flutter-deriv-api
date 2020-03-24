// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_get_settings_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5GetSettingsResponse _$Mt5GetSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5GetSettingsResponse(
    mt5GetSettings: json['mt5_get_settings'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$Mt5GetSettingsResponseToJson(
        Mt5GetSettingsResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'mt5_get_settings': instance.mt5GetSettings,
    };
