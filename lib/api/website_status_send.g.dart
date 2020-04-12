// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_status_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsiteStatusRequest _$WebsiteStatusRequestFromJson(Map<String, dynamic> json) {
  return WebsiteStatusRequest(
    subscribe: json['subscribe'] as int,
    websiteStatus: json['website_status'] as int,
    reqId: json['req_id'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$WebsiteStatusRequestToJson(
        WebsiteStatusRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'subscribe': instance.subscribe,
      'website_status': instance.websiteStatus,
    };
