// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'economic_calendar_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EconomicCalendarRequest _$EconomicCalendarRequestFromJson(
    Map<String, dynamic> json) {
  return EconomicCalendarRequest(
    currency: json['currency'] as String,
    economicCalendar: json['economic_calendar'] as int,
    endDate: json['end_date'] as int,
    startDate: json['start_date'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$EconomicCalendarRequestToJson(
        EconomicCalendarRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'currency': instance.currency,
      'economic_calendar': instance.economicCalendar,
      'end_date': instance.endDate,
      'start_date': instance.startDate,
    };
