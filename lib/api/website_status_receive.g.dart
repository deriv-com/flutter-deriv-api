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
    reqId: json['req_id'] as int,
    msgType: json['msg_type'] as String,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$WebsiteStatusResponseToJson(
        WebsiteStatusResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'msg_type': instance.msgType,
      'echo_req': instance.echoReq,
      'error': instance.error,
      'subscription': instance.subscription,
      'website_status': instance.websiteStatus,
    };
