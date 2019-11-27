// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_status_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsiteStatusRequest _$WebsiteStatusRequestFromJson(Map<String, dynamic> json) {
  return WebsiteStatusRequest()
    ..passthrough = json['passthrough'] as Map<String, dynamic>
    ..reqId = json['req_id'] as int
    ..subscribe = json['subscribe'] as int
    ..websiteStatus = json['website_status'] as int;
}

Map<String, dynamic> _$WebsiteStatusRequestToJson(
        WebsiteStatusRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'subscribe': instance.subscribe,
      'website_status': instance.websiteStatus,
    };
