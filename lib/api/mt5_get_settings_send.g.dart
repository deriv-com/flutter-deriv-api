// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mt5_get_settings_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Mt5GetSettingsRequest _$Mt5GetSettingsRequestFromJson(
    Map<String, dynamic> json) {
  return Mt5GetSettingsRequest()
    ..mt5GetSettings = json['mt5_get_settings'] as int
    ..login = json['login'] as String
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$Mt5GetSettingsRequestToJson(
        Mt5GetSettingsRequest instance) =>
    <String, dynamic>{
      'mt5_get_settings': instance.mt5GetSettings,
      'login': instance.login,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
