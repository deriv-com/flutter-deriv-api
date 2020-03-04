// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_event_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEventResponse _$NotificationEventResponseFromJson(
    Map<String, dynamic> json) {
  return NotificationEventResponse(
    notificationEvent: json['notification_event'] as int,
    reqId: json['req_id'] as int,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    error: json['error'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$NotificationEventResponseToJson(
        NotificationEventResponse instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'echo_req': instance.echoReq,
      'msg_type': instance.msgType,
      'error': instance.error,
      'notification_event': instance.notificationEvent,
    };
