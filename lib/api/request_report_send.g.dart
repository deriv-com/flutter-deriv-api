// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_report_send.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequestReportRequest _$RequestReportRequestFromJson(Map<String, dynamic> json) {
  return RequestReportRequest(
    dateFrom: json['date_from'] as int,
    dateTo: json['date_to'] as int,
    passthrough: json['passthrough'] as Map<String, dynamic>,
    reportType: json['report_type'] as String,
    reqId: json['req_id'] as int,
    requestReport: json['request_report'] as int,
  );
}

Map<String, dynamic> _$RequestReportRequestToJson(
        RequestReportRequest instance) =>
    <String, dynamic>{
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
      'passthrough': instance.passthrough,
      'report_type': instance.reportType,
      'req_id': instance.reqId,
      'request_report': instance.requestReport,
    };
