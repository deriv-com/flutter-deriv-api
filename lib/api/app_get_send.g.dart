// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_get_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppGetRequest _$AppGetRequestFromJson(Map<String, dynamic> json) {
  return AppGetRequest(
    appGet: json['app_get'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AppGetRequestToJson(AppGetRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'app_get': instance.appGet,
    };
