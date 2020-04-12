// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_delete_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDeleteRequest _$AppDeleteRequestFromJson(Map<String, dynamic> json) {
  return AppDeleteRequest(
    appDelete: json['app_delete'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AppDeleteRequestToJson(AppDeleteRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'app_delete': instance.appDelete,
    };
