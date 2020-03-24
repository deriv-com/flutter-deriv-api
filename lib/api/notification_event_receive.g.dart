// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_event_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEventResponse _$NotificationEventResponseFromJson(
    Map<String, dynamic> json) {
  return NotificationEventResponse(
    notificationEvent: json['notification_event'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$NotificationEventResponseToJson(
        NotificationEventResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'notification_event': instance.notificationEvent,
    };
