// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_get_settings_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5GetSettingsResponse _$Mt5GetSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5GetSettingsResponse(
    mt5GetSettings: json['mt5_get_settings'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$Mt5GetSettingsResponseToJson(
        Mt5GetSettingsResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'mt5_get_settings': instance.mt5GetSettings,
    };
