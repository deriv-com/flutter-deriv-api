// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_event_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEventRequest _$NotificationEventRequestFromJson(
    Map<String, dynamic> json) {
  return NotificationEventRequest(
    category: json['category'] as String,
    event: json['event'] as String,
    notificationEvent: json['notification_event'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$NotificationEventRequestToJson(
        NotificationEventRequest instance) =>
    <String, dynamic>{
      'req_id': instance.reqId,
      'passthrough': instance.passthrough,
      'category': instance.category,
      'event': instance.event,
      'notification_event': instance.notificationEvent,
    };
