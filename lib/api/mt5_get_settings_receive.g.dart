// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_get_settings_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5GetSettingsResponse _$Mt5GetSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return Mt5GetSettingsResponse(
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    mt5GetSettings: json['mt5_get_settings'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  )..error = json['error'] as Map<String, dynamic>;
}

Map<String, dynamic> _$Mt5GetSettingsResponseToJson(
        Mt5GetSettingsResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'mt5_get_settings': instance.mt5GetSettings,
      'req_id': instance.reqId,
    };
