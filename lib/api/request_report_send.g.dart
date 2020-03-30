// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_report_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestReportRequest _$RequestReportRequestFromJson(Map<String, dynamic> json) {
  return RequestReportRequest(
    dateFrom: json['date_from'] as int,
    dateTo: json['date_to'] as int,
    reportType: json['report_type'] as String,
    requestReport: json['request_report'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reqId: json['req_id'] as int,
  );
}

Map<String, dynamic> _$RequestReportRequestToJson(
        RequestReportRequest instance) =>
    <String, dynamic>{
      'passthrough': instance.passthrough,
      'req_id': instance.reqId,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
      'report_type': instance.reportType,
      'request_report': instance.requestReport,
    };
