// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'economic_calendar_receive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EconomicCalendarResponse _$EconomicCalendarResponseFromJson(
    Map<String, dynamic> json) {
  return EconomicCalendarResponse(
    economicCalendar: json['economic_calendar'] as Map<String, dynamic>,
    echoReq: json['echo_req'] as Map<String, dynamic>,
    error: json['error'] as Map<String, dynamic>,
    msgType: json['msg_type'] as String,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$EconomicCalendarResponseToJson(
        EconomicCalendarResponse instance) =>
    <String, dynamic>{
      'echo_req': instance.echoReq,
      'error': instance.error,
      'msg_type': instance.msgType,
      'req_id': instance.reqId,
      'economic_calendar': instance.economicCalendar,
    };
