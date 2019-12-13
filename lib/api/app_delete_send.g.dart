// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_delete_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppDeleteRequest _$AppDeleteRequestFromJson(Map<String, dynamic> json) {
  return AppDeleteRequest(
    appDelete: json['app_delete'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AppDeleteRequestToJson(AppDeleteRequest instance) =>
    <String, dynamic>{
      'app_delete': instance.appDelete,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
