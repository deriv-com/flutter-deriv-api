// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_list_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppListRequest _$AppListRequestFromJson(Map<String, dynamic> json) {
  return AppListRequest(
    appList: json['app_list'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$AppListRequestToJson(AppListRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'app_list': instance.appList,
    };
