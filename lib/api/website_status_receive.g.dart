// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_status_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsiteStatusResponse _$WebsiteStatusResponseFromJson(
    Map<String, dynamic> json) {
  return WebsiteStatusResponse()
    ..websiteStatus = json['website_status'] as Map<String, dynamic>
    ..subscription = json['subscription'] as Map<String, dynamic>
    ..echoReq = json['echo_req'] as Map<String, dynamic>
    ..msgType = json['msg_type'] as String
    ..reqId = json['req_id'] as int;
}

Map<String, dynamic> _$WebsiteStatusResponseToJson(
        WebsiteStatusResponse instance) =>
    <String, dynamic>{
      'website_status': instance.websiteStatus,
      'subscription': instance.subscription,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
    };
