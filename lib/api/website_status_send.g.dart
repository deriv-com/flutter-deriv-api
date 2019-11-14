// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_status_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsiteStatusRequest _$WebsiteStatusRequestFromJson(Map<String, dynamic> json) {
  return WebsiteStatusRequest()
    ..websiteStatus = json['website_status'] as int
    ..subscribe = json['subscribe'] as int
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$WebsiteStatusRequestToJson(
        WebsiteStatusRequest instance) =>
    <String, dynamic>{
      'website_status': instance.websiteStatus,
      'subscribe': instance.subscribe,
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
    };
