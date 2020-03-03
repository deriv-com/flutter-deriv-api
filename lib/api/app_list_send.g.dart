// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppListRequest _$AppListRequestFromJson(Map<String, dynamic> json) {
  return AppListRequest(
    appList: json['app_list'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$AppListRequestToJson(AppListRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'app_list': instance.appList,
    };
