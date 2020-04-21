// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'website_status_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsiteStatusResponse _$WebsiteStatusResponseFromJson(
    Map<String, dynamic> json) {
  return WebsiteStatusResponse(
    subscription: json['subscription'] as Map<String, dynamic>,
    websiteStatus: json['website_status'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$WebsiteStatusResponseToJson(
        WebsiteStatusResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'subscription': instance.subscription,
      'website_status': instance.websiteStatus,
    };
