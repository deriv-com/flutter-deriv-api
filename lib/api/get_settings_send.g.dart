// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_settings_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSettingsRequest _$GetSettingsRequestFromJson(Map<String, dynamic> json) {
  return GetSettingsRequest(
    getSettings: json['get_settings'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$GetSettingsRequestToJson(GetSettingsRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'get_settings': instance.getSettings,
    };
